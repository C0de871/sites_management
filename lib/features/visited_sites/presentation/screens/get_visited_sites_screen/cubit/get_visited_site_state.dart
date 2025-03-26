// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';
import 'get_visited_site_cubit.dart';

@immutable
sealed class GetVisitedSitesState {
  const GetVisitedSitesState();
}

class GetVisitedSiteInitial extends GetVisitedSitesState {}

class GetVisitedSiteLoading extends GetVisitedSitesState {}

class GetVisitedSiteSuccess extends GetVisitedSitesState {
  final List<GetVisitedSitesEntity> sites;
  final List<GetVisitedSitesEntity> filteredSites;
  final bool isSelectionMode;
  final bool isSearchMode;
  final String searchQuery;
  final List<GetVisitedSitesEntity> selectedSites;
  final String filterByGovernorate;
  final SortOption currentSort;
  const GetVisitedSiteSuccess({
    required this.sites,
    this.isSelectionMode = false,
    this.isSearchMode = false,
    this.searchQuery = '',
    this.selectedSites = const [],
    this.filterByGovernorate = "All",
    this.currentSort = SortOption.nameAsc,
    required this.filteredSites,
  });

  GetVisitedSiteSuccess copyWith({
    List<GetVisitedSitesEntity>? sites,
    List<GetVisitedSitesEntity>? filteredSites,
    bool? isSelectionMode,
    bool? isSearchMode,
    String? searchQuery,
    List<GetVisitedSitesEntity>? selectedSites,
    String? filterByGovernorate,
    SortOption? currentSort,
  }) {
    return GetVisitedSiteSuccess(
      sites: sites ?? this.sites,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      isSearchMode: isSearchMode ?? this.isSearchMode,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedSites: selectedSites ?? this.selectedSites,
      filterByGovernorate: filterByGovernorate ?? this.filterByGovernorate,
      currentSort: currentSort ?? this.currentSort,
      filteredSites: filteredSites ?? this.filteredSites,
    );
  }
}

class GetVisitedSitesError extends GetVisitedSitesState {
  final String msg;
  const GetVisitedSitesError(this.msg);
}
