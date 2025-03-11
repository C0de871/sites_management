// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/mock_data.dart';
import 'show_visited_site_cubit.dart';

@immutable
sealed class ShowVisitedSiteState {
  const ShowVisitedSiteState();
}

class ShowVisitedSiteInitial extends ShowVisitedSiteState {}

class ShowVisitedSiteLoading extends ShowVisitedSiteState {}

class ShowVisitedSiteSuccess extends ShowVisitedSiteState {
  final List<SiteEntity> sites;
  final List<SiteEntity> filteredSite;
  final bool isSelectionMode;
  final bool isSearchMode;
  final String searchQuery;
  final List<SiteEntity> selectedSites;
  final String? filterByGovernorate;
  final SortOption currentSort;
  const ShowVisitedSiteSuccess({
    required this.sites,
    this.isSelectionMode = false,
    this.isSearchMode = false,
    this.searchQuery = '',
    this.selectedSites = const [],
    this.filterByGovernorate,
    this.currentSort = SortOption.nameAsc,
    this.filteredSite = const [],
  });

  ShowVisitedSiteSuccess copyWith({
    List<SiteEntity>? sites,
    List<SiteEntity>? filteredSites,
    bool? isSelectionMode,
    bool? isSearchMode,
    String? searchQuery,
    List<SiteEntity>? selectedSites,
    String? filterByGovernorate,
    SortOption? currentSort,
    List<SiteEntity>? filteredSite,
  }) {
    return ShowVisitedSiteSuccess(
      sites: sites ?? this.sites,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      isSearchMode: isSearchMode ?? this.isSearchMode,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedSites: selectedSites ?? this.selectedSites,
      filterByGovernorate: filterByGovernorate ?? this.filterByGovernorate,
      currentSort: currentSort ?? this.currentSort,
      filteredSite: filteredSite ?? this.filteredSite,
    );
  }
}

class ShowVisitedSiteError extends ShowVisitedSiteState {
  final String msg;
  const ShowVisitedSiteError(this.msg);
}
