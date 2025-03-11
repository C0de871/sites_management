import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sites_management/core/helper/mock_data.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';

class ShowVisitedSiteCubit extends Cubit<ShowVisitedSiteState> {
  ShowVisitedSiteCubit() : super(ShowVisitedSiteInitial());

  final List<String> allGovernorates = ['All', 'Cairo', 'Alexandria', 'Giza', 'Aswan', 'Dakahlia'];
  late TextEditingController searchController = TextEditingController();
  late AnimationController animationController;
  late Animation<double> animation;

  void toggleSelectionMode() {
    if (state is ShowVisitedSiteSuccess) {
      final currentState = state as ShowVisitedSiteSuccess;
      ShowVisitedSiteSuccess newState = currentState;
      if (currentState.isSelectionMode) {
        newState = currentState.copyWith(selectedSites: [], isSelectionMode: !currentState.isSelectionMode);
      } else {
        newState = currentState.copyWith(isSelectionMode: !currentState.isSelectionMode);
      }
      emit(newState);
    }
  }

  fetchSites() {
    emit(ShowVisitedSiteLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(ShowVisitedSiteSuccess(sites: mockSites));
    });
  }

  void toggleSearchMode() {
    if (state is ShowVisitedSiteSuccess) {
      final currentState = state as ShowVisitedSiteSuccess;
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

  void toggleSiteSelection(SiteEntity site) {
    if (state is ShowVisitedSiteSuccess) {
      final currentState = state as ShowVisitedSiteSuccess;
      List<SiteEntity> selectedSites = currentState.selectedSites;
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

  void confirmDelete() {
    //todo
    // In a real app, you would call your API to delete sites

    // setState(() {
    //   _mockSites.removeWhere((site) => _selectedSites.contains(site));
    //   _toggleSelectionMode();
    // });
    // Navigator.pop(context);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text('Sites deleted successfully'),
    //     backgroundColor: Colors.green,
    //     behavior: SnackBarBehavior.floating,
    //   ),
    // );
  }

  void handleApplyFilterAndSort() {
    if (state is! ShowVisitedSiteSuccess) return;

    final currentState = state as ShowVisitedSiteSuccess;
    final searchQuery = currentState.searchQuery.toLowerCase();
    final governorateFilter = currentState.filterByGovernorate;
    final sortOption = currentState.currentSort;

    var filteredSites = _filterSites(List<SiteEntity>.from(currentState.sites), searchQuery, governorateFilter);

    _sortSites(filteredSites, sortOption);

    emit(currentState.copyWith(filteredSites: filteredSites));
  }

  List<SiteEntity> _filterSites(List<SiteEntity> sites, String searchQuery, String? governorateFilter) {
    sites = _filterBySearchQuery(sites, searchQuery);
    sites = _filterByGovernorate(sites, governorateFilter);
    return sites;
  }

  List<SiteEntity> _filterBySearchQuery(List<SiteEntity> sites, String searchQuery) {
    if (searchQuery.isEmpty) return sites;

    return sites.where((site) {
      final siteText = [
        site.name,
        site.code,
        site.governorate,
        site.city,
      ].map((text) => text.toLowerCase());

      return siteText.any((text) => text.contains(searchQuery));
    }).toList();
  }

  List<SiteEntity> _filterByGovernorate(List<SiteEntity> sites, String? governorateFilter) {
    if (governorateFilter == null) return sites;

    return sites.where((site) => site.governorate == governorateFilter).toList();
  }

  void _sortSites(List<SiteEntity> sites, SortOption sortOption) {
    sites.sort((a, b) {
      switch (sortOption) {
        case SortOption.nameAsc:
          return a.name.compareTo(b.name);
        case SortOption.nameDesc:
          return b.name.compareTo(a.name);
        case SortOption.codeAsc:
          return a.code.compareTo(b.code);
        case SortOption.codeDesc:
          return b.code.compareTo(a.code);
      }
    });
  }

  void handleReset() {
    if (state is ShowVisitedSiteSuccess) {
      ShowVisitedSiteSuccess currentState = state as ShowVisitedSiteSuccess;
      emit(currentState.copyWith(filterByGovernorate: null, currentSort: SortOption.nameAsc));
    }
  }

  void handleGovernorateSelection(String? governorate) {
    if (state is ShowVisitedSiteSuccess) {
      ShowVisitedSiteSuccess currentState = state as ShowVisitedSiteSuccess;
      emit(currentState.copyWith(filterByGovernorate: governorate));
    }
  }

  void handleSortSelection(bool selected, SortOption sortOption) {
    if (!selected) return;
    if (state is ShowVisitedSiteSuccess) {
      ShowVisitedSiteSuccess currentState = state as ShowVisitedSiteSuccess;
      emit(currentState.copyWith(currentSort: sortOption));
    }
  }

  void deleteSearchQueryAndFilters() {
    deleteSearchQuery();
    deleteFilter();
  }

  void deleteSearchQuery() {
    if (state is ShowVisitedSiteSuccess) {
      searchController.clear();
      emit((state as ShowVisitedSiteSuccess).copyWith(searchQuery: ''));
    }
  }

  void deleteFilter() {
    if (state is ShowVisitedSiteSuccess) {
      emit((state as ShowVisitedSiteSuccess).copyWith(filterByGovernorate: null));
    }
  }

  setSearchResult(String value) {
    if (state is ShowVisitedSiteSuccess) {
      emit((state as ShowVisitedSiteSuccess).copyWith(searchQuery: value));
    }
  }
}

enum SortOption { nameAsc, nameDesc, codeAsc, codeDesc }
