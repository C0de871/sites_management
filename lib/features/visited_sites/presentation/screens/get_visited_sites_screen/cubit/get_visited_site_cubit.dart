import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/databases/errors/failure.dart';
import '../../../../../../core/shared/models/message_model.dart';
import '../../../../../../core/utils/commands/command.dart';
import '../../../../../../core/utils/services/service_locator.dart';
import '../../../../data/services/visited_site_event_bus.dart';
import '../../../../domain/entities/get_visited_sites/get_visited_sites_entity.dart';
import '../../../../domain/use_cases/delete_visited_sites_use_case.dart';
import '../../../../domain/use_cases/export_visited_site_use_case.dart';
import '../../../../domain/use_cases/get_visited_sites_use_case.dart';
import 'get_visited_site_state.dart';

class GetVisitedSitesCubit extends Cubit<GetVisitedSitesState> {
  final GetVisitedSitesUseCase _getVisitedSitesUseCase;
  final ExportVisitedSiteUseCase _exportVisitedSitesUseCase;
  final DeleteVisitedSitesUseCase _deleteVisitedSiteUseCase;

  final VisitedSitesEventBus _eventBus;
  StreamSubscription? _eventSubscription;

  late final Command0<MessageModel> exportCommand;
  late final Command0<MessageModel> deleteCommand;

  GetVisitedSitesCubit()
      : _getVisitedSitesUseCase = getIt(),
        _exportVisitedSitesUseCase = getIt(),
        _deleteVisitedSiteUseCase = getIt(),
        _eventBus = getIt(),
        super(GetVisitedSiteInitial()) {
    exportCommand = Command0<MessageModel>(_exportSelectedSites);
    deleteCommand = Command0<MessageModel>(_deleteSelectedSites);
    _listenToEvents();
  }

  final List<String> allGovernorates = ['All', 'Cairo', 'Alexandria', 'Giza', 'Aswan', 'Dakahlia'];
  late TextEditingController searchController = TextEditingController();
  late AnimationController animationController;
  late Animation<double> animation;

  void _listenToEvents() {
    _eventSubscription = _eventBus.events.listen((event) {
      if (state is GetVisitedSiteSuccess) {
        final currentSites = (state as GetVisitedSiteSuccess).sites;
        List<GetVisitedSitesEntity> updatedItems = List.from(currentSites);
        switch (event) {
          case VisitedSiteAddedEvent():
            updatedItems.add(event.site);
            emit((state as GetVisitedSiteSuccess).copyWith(
              sites: updatedItems,
              filteredSites: updatedItems,
            ));
            break;
          case VisitedSiteDeletedEvent():
            // TODO: Handle this case.
            throw UnimplementedError();
          case VisitedSiteUpdatedEvent():
            // TODO: Handle this case.
            throw UnimplementedError();
        }
        handleApplyFilterAndSort();
      }
    });
  }

  void toggleSelectionMode() {
    if (state is GetVisitedSiteSuccess) {
      final currentState = state as GetVisitedSiteSuccess;
      GetVisitedSiteSuccess newState = currentState;
      if (currentState.isSelectionMode) {
        newState = currentState.copyWith(selectedSites: [], isSelectionMode: !currentState.isSelectionMode);
      } else {
        newState = currentState.copyWith(isSelectionMode: !currentState.isSelectionMode);
      }
      emit(newState);
    }
  }

  fetchSites() async {
    emit(GetVisitedSiteLoading());
    final response = await _getVisitedSitesUseCase.call();
    response.fold(
      (error) {
        emit(GetVisitedSitesError(error.errMessage));
      },
      (data) {
        emit(GetVisitedSiteSuccess(sites: data, filteredSites: data));
      },
    );
  }

  void toggleSearchMode() {
    if (state is GetVisitedSiteSuccess) {
      final currentState = state as GetVisitedSiteSuccess;
      bool isSearchMode = currentState.isSearchMode;
      String searchQuery = currentState.searchQuery;
      isSearchMode = !isSearchMode;
      if (!isSearchMode) {
        searchQuery = '';
        searchController.clear();
        // FocusScope.of(context).unfocus(); //todo
      } else {
        // FocusScope.of(context).requestFocus(FocusNode()); //todo
      }
      emit(currentState.copyWith(isSearchMode: isSearchMode, searchQuery: searchQuery));
      if (isSearchMode) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  void toggleSiteSelection(GetVisitedSitesEntity site) {
    if (state is GetVisitedSiteSuccess) {
      final currentState = state as GetVisitedSiteSuccess;
      List<GetVisitedSitesEntity> selectedSites = List.from(currentState.selectedSites);
      bool isSelectionMode = currentState.isSelectionMode;
      if (selectedSites.contains(site)) {
        selectedSites.remove(site);
      } else {
        selectedSites.add(site);
      }

      if (selectedSites.isEmpty && isSelectionMode) {
        isSelectionMode = false;
      }
      emit(currentState.copyWith(selectedSites: selectedSites, isSelectionMode: isSelectionMode));
    }
  }

  Future<Either<Failure, MessageModel>> _deleteSelectedSites() async {
    if (state is! GetVisitedSiteSuccess) return Left(Failure(errMessage: "there is no selected sites"));
    if ((state as GetVisitedSiteSuccess).selectedSites.isEmpty) return Left(Failure(errMessage: "there is no selected sites"));

    final body = {
      "ids": (state as GetVisitedSiteSuccess).selectedSites.map((e) => e.id).toList(),
    };
    final response = await _deleteVisitedSiteUseCase.call(body: body);
    return response;
  }

  Future<Either<Failure, MessageModel>> _exportSelectedSites() async {
    if (state is! GetVisitedSiteSuccess) return Left(Failure(errMessage: "there is no selected sites"));
    if ((state as GetVisitedSiteSuccess).selectedSites.isEmpty) return Left(Failure(errMessage: "there is no selected sites"));
    final body = {
      "site_ids": (state as GetVisitedSiteSuccess).selectedSites.map((e) => e.id).toList(),
    };

    //todo edit file name to be recieved from user:
    log(body.toString());
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd_HH-mm-ss'); // Safe format
    final String formattedDate = formatter.format(now);
    final response = await _exportVisitedSitesUseCase.call(body: body, fileName:formattedDate);
    return response;
  }

  void handleApplyFilterAndSort() {
    if (state is! GetVisitedSiteSuccess) return;

    final currentState = state as GetVisitedSiteSuccess;
    final searchQuery = currentState.searchQuery.toLowerCase();
    final governorateFilter = currentState.filterByGovernorate;
    final sortOption = currentState.currentSort;

    var filteredSites = _filterSites(List<GetVisitedSitesEntity>.from(currentState.sites), searchQuery, governorateFilter);

    _sortSites(filteredSites, sortOption);
    log(filteredSites.toString());

    emit(currentState.copyWith(filteredSites: filteredSites));
  }

  List<GetVisitedSitesEntity> _filterSites(List<GetVisitedSitesEntity> sites, String searchQuery, String? governorateFilter) {
    sites = _filterBySearchQuery(sites, searchQuery);
    sites = _filterByCity(sites, governorateFilter);
    return sites;
  }

  List<GetVisitedSitesEntity> _filterBySearchQuery(List<GetVisitedSitesEntity> sites, String searchQuery) {
    if (searchQuery.isEmpty) return sites;

    return sites.where((site) {
      final siteText = [
        site.name,
        site.code,
        site.street,
        site.city,
      ].map((text) => text?.toLowerCase());

      return siteText.any((text) {
        return text?.contains(searchQuery) ?? false;
      });
    }).toList();
  }

  List<GetVisitedSitesEntity> _filterByCity(List<GetVisitedSitesEntity> sites, String? cityFilter) {
    if (cityFilter == "All") return sites;

    return sites.where((site) => site.city == cityFilter).toList();
  }

  void _sortSites(List<GetVisitedSitesEntity> sites, SortOption sortOption) {
    log(sortOption.toString());
    sites.sort((a, b) {
      switch (sortOption) {
        case SortOption.nameAsc:
          return (a.name ?? '').compareTo(b.name ?? '');
        case SortOption.nameDesc:
          return (b.name ?? '').compareTo(a.name ?? '');
        case SortOption.codeAsc:
          return (a.code ?? '').compareTo(b.code ?? '');
        case SortOption.codeDesc:
          return (b.code ?? '').compareTo(a.code ?? '');
      }
    });
  }

  void handleReset() {
    if (state is GetVisitedSiteSuccess) {
      GetVisitedSiteSuccess currentState = state as GetVisitedSiteSuccess;
      emit(currentState.copyWith(filterByGovernorate: "All", currentSort: SortOption.nameAsc));
    }
  }

  void handleGovernorateSelection(String? governorate) {
    if (state is GetVisitedSiteSuccess) {
      GetVisitedSiteSuccess currentState = state as GetVisitedSiteSuccess;
      emit(currentState.copyWith(filterByGovernorate: governorate));
    }
  }

  void handleSortSelection(bool selected, SortOption sortOption) {
    if (!selected) return;
    if (state is GetVisitedSiteSuccess) {
      GetVisitedSiteSuccess currentState = state as GetVisitedSiteSuccess;
      emit(currentState.copyWith(currentSort: sortOption));
    }
  }

  void deleteSearchQueryAndFilters() {
    deleteSearchQuery();
    deleteFilter();
  }

  void deleteSearchQuery() {
    if (state is GetVisitedSiteSuccess) {
      searchController.clear();
      emit((state as GetVisitedSiteSuccess).copyWith(searchQuery: ''));
    }
  }

  void deleteFilter() {
    if (state is GetVisitedSiteSuccess) {
      emit((state as GetVisitedSiteSuccess).copyWith(filterByGovernorate: "All"));
    }
    handleApplyFilterAndSort();
  }

  setSearchResult(String value) {
    if (state is GetVisitedSiteSuccess) {
      emit((state as GetVisitedSiteSuccess).copyWith(searchQuery: value));
    }
    handleApplyFilterAndSort();
  }

  @override
  Future<void> close() {
    _eventSubscription?.cancel();
    return super.close();
  }
}

enum SortOption { nameAsc, nameDesc, codeAsc, codeDesc }
