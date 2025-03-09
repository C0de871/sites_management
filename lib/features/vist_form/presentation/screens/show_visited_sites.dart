import 'package:flutter/material.dart';

import '../../../../core/Routes/app_routes.dart';
import 'show_site_details.dart';



enum SortOption { nameAsc, nameDesc, codeAsc, codeDesc }

class SitesListPage extends StatefulWidget {
  const SitesListPage({super.key});

  @override
  State<SitesListPage> createState() => _SitesListPageState();
}

class _SitesListPageState extends State<SitesListPage> with SingleTickerProviderStateMixin {
  final List<SiteEntity> _selectedSites = [];
  bool _isSelectionMode = false;
  bool _isSearchMode = false;
  String _searchQuery = '';
  late TextEditingController _searchController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  // For filtering
  String? _filterByGovernorate;
  final List<String> _allGovernorates = ['All', 'Cairo', 'Alexandria', 'Giza', 'Aswan', 'Dakahlia'];

  // For sorting
  SortOption _currentSort = SortOption.nameAsc;

  // This would come from your API in a real implementation
  final List<SiteEntity> _mockSites = [
    SiteEntity(
      id: '1',
      name: 'Central Tower Site',
      code: 'CTS001',
      governorate: 'Cairo',
      street: 'Talaat Harb',
      area: 'Downtown',
      city: 'Cairo',
    ),
    SiteEntity(
      id: '2',
      name: 'Eastern Gateway Site',
      code: 'EGS002',
      governorate: 'Alexandria',
      street: 'Corniche Road',
      area: 'Gleem',
      city: 'Alexandria',
    ),
    SiteEntity(
      id: '3',
      name: 'Western Hills Relay',
      code: 'WHR003',
      governorate: 'Giza',
      street: 'Pyramids Rd',
      area: 'Haram',
      city: 'Giza',
    ),
    SiteEntity(
      id: '4',
      name: 'Southern Valley Tower',
      code: 'SVT004',
      governorate: 'Aswan',
      street: 'Nile Avenue',
      area: 'Central',
      city: 'Aswan',
    ),
    SiteEntity(
      id: '5',
      name: 'Delta Network Hub',
      code: 'DNH005',
      governorate: 'Dakahlia',
      street: 'El Gomhoria',
      area: 'Mansoura',
      city: 'Mansoura',
    ),
    SiteEntity(
      id: '1',
      name: 'Central Tower Site',
      code: 'CTS001',
      governorate: 'Cairo',
      street: 'Talaat Harb',
      area: 'Downtown',
      city: 'Cairo',
    ),
    SiteEntity(
      id: '2',
      name: 'Eastern Gateway Site',
      code: 'EGS002',
      governorate: 'Alexandria',
      street: 'Corniche Road',
      area: 'Gleem',
      city: 'Alexandria',
    ),
    SiteEntity(
      id: '3',
      name: 'Western Hills Relay',
      code: 'WHR003',
      governorate: 'Giza',
      street: 'Pyramids Rd',
      area: 'Haram',
      city: 'Giza',
    ),
    SiteEntity(
      id: '4',
      name: 'Southern Valley Tower',
      code: 'SVT004',
      governorate: 'Aswan',
      street: 'Nile Avenue',
      area: 'Central',
      city: 'Aswan',
    ),
    SiteEntity(
      id: '5',
      name: 'Delta Network Hub',
      code: 'DNH005',
      governorate: 'Dakahlia',
      street: 'El Gomhoria',
      area: 'Mansoura',
      city: 'Mansoura',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSelectionMode() {
    setState(() {
      _isSelectionMode = !_isSelectionMode;
      if (!_isSelectionMode) {
        _selectedSites.clear();
      }
    });
  }

  void _toggleSearchMode() {
    setState(() {
      _isSearchMode = !_isSearchMode;
      if (!_isSearchMode) {
        _searchQuery = '';
        _searchController.clear();
        FocusScope.of(context).unfocus();
      } else {
        Future.delayed(const Duration(milliseconds: 100), () {
          FocusScope.of(context).requestFocus(FocusNode());
        });
      }
    });

    if (_isSearchMode) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _toggleSiteSelection(SiteEntity site) {
    setState(() {
      if (_selectedSites.contains(site)) {
        _selectedSites.remove(site);
      } else {
        _selectedSites.add(site);
      }

      if (_selectedSites.isEmpty && _isSelectionMode) {
        _isSelectionMode = false;
      }
    });
  }

  void _navigateToSiteDetails(SiteEntity site) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SiteDetailsPage(site: site),
      ),
    ).then((needsRefresh) {
      if (needsRefresh == true) {
        // In a real app, you would refresh the sites list here
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Site updated successfully'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  void _deleteSelectedSites() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 8),
            const Text('Delete Sites'),
          ],
        ),
        content: Text(
          'Are you sure you want to delete ${_selectedSites.length} selected site(s)?\nThis action cannot be undone.',
        ),
        actions: [
          const DeleteButton(),
          ConfirmDeleteButton(onPressed: confirmDelete),
        ],
      ),
    );
  }

  void confirmDelete() {
    // In a real app, you would call your API to delete sites
    setState(() {
      _mockSites.removeWhere((site) => _selectedSites.contains(site));
      _toggleSelectionMode();
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sites deleted successfully'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _exportSelectedSites() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.file_download, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text('Export to Excel', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
        content: Text(
          'Do you want to export ${_selectedSites.isEmpty ? "all" : _selectedSites.length} sites to Excel?',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        actions: [
          const DeleteButton(),
          ConfirmExportButton(
            onExport: _toggleSelectionMode,
          ),
        ],
      ),
    );
  }

  void _showFilterSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterAndSortLabel(),
              const Divider(height: 32),
              const FilterByGovernorateLabel(),
              const SizedBox(height: 8),
              GovernorateChoices(
                governorates: _allGovernorates,
                selectedGovernorate: _filterByGovernorate,
                onGovernorateSelected: (governorate) {
                  _handleGovernorateSelection(setModalState, governorate);
                },
              ),
              const SizedBox(height: 24),
              const SortByLabel(),
              const SizedBox(height: 8),
              SortByChoices(
                setModalState: setModalState,
                handleSortSelection: handleSortSelection,
                currentSort: _currentSort,
              ),
              const SizedBox(height: 24),
              ActionButtonList(
                onReset: () => _handleReset(setModalState),
                onApply: _handleApplyFilterAndSort,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleApplyFilterAndSort() {
    setState(() {
      _filterByGovernorate = _filterByGovernorate;
      _currentSort = _currentSort;
    });
  }

  void _handleReset(StateSetter setModalState) {
    setModalState(() {
      _filterByGovernorate = null;
      _currentSort = SortOption.nameAsc;
    });
  }

  void _handleGovernorateSelection(StateSetter setModalState, String? governorate) {
    setModalState(() {
      _filterByGovernorate = governorate;
    });
  }

  void handleSortSelection(bool selected, SortOption sortOption, StateSetter setModalState) {
    setModalState(() {
      if (selected) {
        _currentSort = sortOption;
      }
    });
  }

  List<SiteEntity> _getFilteredAndSortedSites() {
    List<SiteEntity> filteredSites = List.from(_mockSites);

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredSites = filteredSites.where((site) => site.name.toLowerCase().contains(_searchQuery.toLowerCase()) || site.code.toLowerCase().contains(_searchQuery.toLowerCase()) || site.governorate.toLowerCase().contains(_searchQuery.toLowerCase()) || site.city.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }

    // Apply governorate filter
    if (_filterByGovernorate != null) {
      filteredSites = filteredSites.where((site) => site.governorate == _filterByGovernorate).toList();
    }

    // Apply sorting
    switch (_currentSort) {
      case SortOption.nameAsc:
        filteredSites.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortOption.nameDesc:
        filteredSites.sort((a, b) => b.name.compareTo(a.name));
        break;
      case SortOption.codeAsc:
        filteredSites.sort((a, b) => a.code.compareTo(b.code));
        break;
      case SortOption.codeDesc:
        filteredSites.sort((a, b) => b.code.compareTo(a.code));
        break;
    }

    return filteredSites;
  }

  @override
  Widget build(BuildContext context) {
    final filteredSites = _getFilteredAndSortedSites();

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBarWidget(
                innerBoxIsScrolled: innerBoxIsScrolled,
                isSearchMode: _isSearchMode,
                searchController: _searchController,
                animation: _animation,
                setSearchResult: setSearchResult,
                deleteSearchQuery: deleteSearchQuery,
                appBarActions: _appBarActions(),
              )
            ];
          },
          body: SiteListAndFilterInfoBody(
            filteredSites: filteredSites,
            isSelectionMode: _isSelectionMode,
            selectedSites: _selectedSites,
            searchQuery: _searchQuery,
            filterByGovernorate: _filterByGovernorate,
            onClearFilters: deleteSearchQueryAndFilters,
            onToggleSelectionMode: _toggleSelectionMode,
            onToggleSiteSelection: _toggleSiteSelection,
            onNavigateToSiteDetails: _navigateToSiteDetails,
            deleteFilter: deleteFilter,
          )),
      floatingActionButton: CustomFlotingActionButton(isSelectionMode: _isSelectionMode),
    );
  }

  void deleteSearchQueryAndFilters() {
    deleteSearchQuery();
    deleteFilter();
  }

  void deleteSearchQuery() {
    setState(() {
      _searchQuery = '';
      _searchController.clear();
    });
  }

  void deleteFilter() {
    setState(() {
      _filterByGovernorate = null;
    });
  }

  List<Widget> _appBarActions() {
    return [
      IconButton(
        icon: Icon(
          _isSearchMode ? Icons.search_off : Icons.search,
        ),
        onPressed: _toggleSearchMode,
      ),
      if (_isSelectionMode)
        IconButton(
          icon: const Icon(
            Icons.delete_outline,
          ),
          onPressed: _selectedSites.isEmpty ? null : _deleteSelectedSites,
        ),
      IconButton(
        icon: Icon(
          _isSelectionMode ? Icons.cancel : Icons.checklist,
        ),
        onPressed: _toggleSelectionMode,
      ),
      IconButton(
        icon: const Icon(
          Icons.file_download,
        ),
        onPressed: _exportSelectedSites,
      ),
      IconButton(
        icon: const Icon(
          Icons.filter_list,
        ),
        onPressed: _showFilterSortBottomSheet,
      ),
    ];
  }

  setSearchResult(String value) {
    setState(() {
      _searchQuery = value;
    });
  }
}

class SliverAppBarWidget extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final bool isSearchMode;
  final TextEditingController searchController;
  final Animation<double> animation;
  final Function(String) setSearchResult;
  final VoidCallback deleteSearchQuery;
  final List<Widget> appBarActions;

  const SliverAppBarWidget({
    super.key,
    required this.innerBoxIsScrolled,
    required this.isSearchMode,
    required this.searchController,
    required this.animation,
    required this.setSearchResult,
    required this.deleteSearchQuery,
    required this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      floating: true,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      snap: true,
      forceElevated: innerBoxIsScrolled,
      flexibleSpace: FlexibleSpaceBarWidget(
        isSearchMode: isSearchMode,
        searchController: searchController,
        animation: animation,
        setSearchResult: setSearchResult,
        deleteSearchQuery: deleteSearchQuery,
      ),
      actions: appBarActions,
      bottom: const CustomBottomBarDecoration(),
    );
  }
}

class FlexibleSpaceBarWidget extends StatelessWidget {
  final bool isSearchMode;
  final TextEditingController searchController;
  final Animation<double> animation;
  final Function(String) setSearchResult;
  final VoidCallback deleteSearchQuery;

  const FlexibleSpaceBarWidget({
    super.key,
    required this.isSearchMode,
    required this.searchController,
    required this.animation,
    required this.setSearchResult,
    required this.deleteSearchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: 1,
      centerTitle: true,
      title: isSearchMode
          ? SearchField(
              searchController: searchController,
              animation: animation,
              onChanged: setSearchResult,
              onPressed: deleteSearchQuery,
            )
          : const AppBarTitle(),
      background: const AppBarDecoratedContainer(),
    );
  }
}

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final Animation<double> animation;
  final Function(String) onChanged;
  final Function() onPressed;

  const SearchField({
    super.key,
    required this.searchController,
    required this.animation,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final width = MediaQuery.of(context).size.width * 0.7 * animation.value;

          return SizedBox(
            width: width,
            child: ClipRect(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search sites...',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                    ),
                    onPressed: onPressed,
                  ),
                ),
                style: const TextStyle(fontSize: 16),
                onChanged: (value) {
                  onChanged(value);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SitesListOrNotAvailable extends StatelessWidget {
  final List<SiteEntity> filteredSites;
  final bool isSelectionMode;
  final List<SiteEntity> selectedSites;
  final String searchQuery;
  final String? filterByGovernorate;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleSelectionMode;
  final Function(SiteEntity) onToggleSiteSelection;
  final Function(SiteEntity) onNavigateToSiteDetails;

  const SitesListOrNotAvailable({
    super.key,
    required this.filteredSites,
    required this.isSelectionMode,
    required this.selectedSites,
    required this.searchQuery,
    required this.filterByGovernorate,
    required this.onClearFilters,
    required this.onToggleSelectionMode,
    required this.onToggleSiteSelection,
    required this.onNavigateToSiteDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: filteredSites.isEmpty
          ? NoSiteAvailable(
              searchQuery: searchQuery,
              filterByGovernorate: filterByGovernorate,
              onClear: onClearFilters,
            )
          : SiteList(
              filteredSites: filteredSites,
              isSelectionMode: isSelectionMode,
              selectedSites: selectedSites,
              onToggleSelectionMode: onToggleSelectionMode,
              onToggleSiteSelection: onToggleSiteSelection,
              onNavigateToSiteDetails: onNavigateToSiteDetails,
            ),
    );
  }
}

class SiteCard extends StatelessWidget {
  final bool isSelected;
  final SiteEntity site;
  final bool isSelectionMode;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final ValueChanged<bool?> onCheckboxChanged;

  const SiteCard({
    super.key,
    required this.isSelected,
    required this.site,
    required this.isSelectionMode,
    required this.onTap,
    required this.onLongPress,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isSelected ? BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 2) : BorderSide.none,
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: isSelected
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.surfaceContainerLow,
                        Theme.of(context).colorScheme.surfaceContainerLowest,
                      ],
                    )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (isSelectionMode)
                    SiteCheckBox(
                      isSelected: isSelected,
                      site: site,
                      onChanged: onCheckboxChanged,
                    ),
                  SiteFirstChar(site: site),
                  const SizedBox(width: 16),
                  SiteCardBody(site: site),
                  SeeMoreDetailsIcon(isSelected: isSelected),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SiteCheckBox extends StatelessWidget {
  final bool isSelected;
  final SiteEntity site;
  final ValueChanged<bool?> onChanged;

  const SiteCheckBox({
    super.key,
    required this.isSelected,
    required this.site,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Checkbox(
        value: isSelected,
        activeColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class NoSiteAvailable extends StatelessWidget {
  final String searchQuery;
  final String? filterByGovernorate;
  final VoidCallback onClear;

  const NoSiteAvailable({
    super.key,
    required this.searchQuery,
    required this.filterByGovernorate,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NoSiteAvailableIcon(),
          const SizedBox(height: 16),
          NoSiteAvailableText(searchQuery: searchQuery),
          if (searchQuery.isNotEmpty || filterByGovernorate != null) ClearFilterButton(onClear: onClear),
        ],
      ),
    );
  }
}

class GovernorateChoices extends StatelessWidget {
  final List<String> governorates;
  final String? selectedGovernorate;
  final ValueChanged<String?> onGovernorateSelected;

  const GovernorateChoices({
    super.key,
    required this.governorates,
    required this.selectedGovernorate,
    required this.onGovernorateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: governorates.length,
        itemBuilder: (context, index) {
          final governorate = governorates[index];
          final isSelected = selectedGovernorate == (governorate == 'All' ? null : governorate);

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(governorate),
              selected: isSelected,
              selectedColor: Theme.of(context).colorScheme.inversePrimary,
              onSelected: (selected) {
                onGovernorateSelected(selected ? (governorate == 'All' ? null : governorate) : null);
              },
            ),
          );
        },
      ),
    );
  }
}

class ConfirmDeleteButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ConfirmDeleteButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.error,
        foregroundColor: Theme.of(context).colorScheme.onError,
      ),
      child: const Text('Delete'),
    );
  }
}

class ClearFilterButton extends StatelessWidget {
  final VoidCallback onClear;

  const ClearFilterButton({super.key, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.refresh),
      label: const Text('Clear filters'),
      onPressed: onClear,
    );
  }
}

class SiteListAndFilterInfoBody extends StatelessWidget {
  final List<SiteEntity> filteredSites;
  final bool isSelectionMode;
  final List<SiteEntity> selectedSites;
  final String searchQuery;
  final String? filterByGovernorate;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleSelectionMode;
  final Function(SiteEntity) onToggleSiteSelection;
  final Function(SiteEntity) onNavigateToSiteDetails;
  final VoidCallback deleteFilter;

  const SiteListAndFilterInfoBody({
    super.key,
    required this.filteredSites,
    required this.isSelectionMode,
    required this.selectedSites,
    required this.searchQuery,
    required this.filterByGovernorate,
    required this.onClearFilters,
    required this.onToggleSelectionMode,
    required this.onToggleSiteSelection,
    required this.onNavigateToSiteDetails,
    required this.deleteFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter & stats info
        FilterAndStatsInfo(
          deleteFilter: deleteFilter,
          filterByGovernorate: filterByGovernorate,
          filteredSites: filteredSites,
        ),
        // Sites list
        SitesListOrNotAvailable(
          filteredSites: filteredSites,
          isSelectionMode: isSelectionMode,
          selectedSites: selectedSites,
          searchQuery: searchQuery,
          filterByGovernorate: filterByGovernorate,
          onClearFilters: onClearFilters,
          onToggleSelectionMode: onToggleSelectionMode,
          onToggleSiteSelection: onToggleSiteSelection,
          onNavigateToSiteDetails: onNavigateToSiteDetails,
        ),
      ],
    );
  }
}

class FilterAndStatsInfo extends StatelessWidget {
  final List<SiteEntity> filteredSites;
  final String? filterByGovernorate;
  final VoidCallback deleteFilter;

  const FilterAndStatsInfo({
    super.key,
    required this.filteredSites,
    required this.filterByGovernorate,
    required this.deleteFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SitesNumber(filteredSites: filteredSites),
          if (filterByGovernorate != null)
            FilterChip(
              filterByGovernorate: filterByGovernorate,
              onDelete: deleteFilter,
            ),
        ],
      ),
    );
  }
}

class SortChip extends StatelessWidget {
  const SortChip({super.key, required this.label, required this.sortOption, required this.handleSortSelection, required this.currentSort});

  final String label;
  final SortOption sortOption;
  final SortOption currentSort;
  final void Function(bool) handleSortSelection;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: currentSort == sortOption,
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      onSelected: (selected) => handleSortSelection(selected),
    );
  }
}

class AppBarDecoratedContainer extends StatelessWidget {
  const AppBarDecoratedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.inversePrimary,
          ],
        ),
      ),
      child: const Stack(
        children: [
          CircleDecoration(
            top: -50,
            right: -50,
            width: 200,
            height: 200,
            alpha: 0.3,
          ),
          CircleDecoration(
            left: -30,
            bottom: -30,
            width: 120,
            height: 120,
            alpha: 0.3,
          ),
        ],
      ),
    );
  }
}

class FilterChip extends StatefulWidget {
  final String? filterByGovernorate;
  final VoidCallback onDelete;

  const FilterChip({
    super.key,
    required this.filterByGovernorate,
    required this.onDelete,
  });

  @override
  State<FilterChip> createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.filter_list,
            size: 16,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 4),
          Text(
            widget.filterByGovernorate ?? '',
            style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      deleteIcon: Icon(
        Icons.close,
        size: 16,
        color: Theme.of(context).colorScheme.onTertiaryContainer,
      ),
      onDeleted: widget.onDelete,
    );
  }
}

class SortByChoices extends StatelessWidget {
  const SortByChoices({super.key, required this.setModalState, required this.handleSortSelection, required this.currentSort});

  final StateSetter setModalState;
  final void Function(bool, SortOption, StateSetter) handleSortSelection;
  final SortOption currentSort;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        SortChip(
          label: 'Name (A-Z)',
          sortOption: SortOption.nameAsc,
          currentSort: currentSort,
          handleSortSelection: (selected) => handleSortSelection(selected, SortOption.nameAsc, setModalState),
        ),
        SortChip(
          label: 'Name (Z-A)',
          sortOption: SortOption.nameDesc,
          currentSort: currentSort,
          handleSortSelection: (selected) => handleSortSelection(selected, SortOption.nameDesc, setModalState),
        ),
        SortChip(
          label: 'Code (Low-High)',
          sortOption: SortOption.codeAsc,
          currentSort: currentSort,
          handleSortSelection: (selected) => handleSortSelection(selected, SortOption.codeAsc, setModalState),
        ),
        SortChip(
          label: 'Code (High-Low)',
          sortOption: SortOption.codeDesc,
          currentSort: currentSort,
          handleSortSelection: (selected) => handleSortSelection(selected, SortOption.codeDesc, setModalState),
        ),
      ],
    );
  }
}

class SiteList extends StatelessWidget {
  final List<SiteEntity> filteredSites;
  final bool isSelectionMode;
  final List<SiteEntity> selectedSites;
  final VoidCallback onToggleSelectionMode;
  final Function(SiteEntity) onToggleSiteSelection;
  final Function(SiteEntity) onNavigateToSiteDetails;

  const SiteList({
    super.key,
    required this.filteredSites,
    required this.isSelectionMode,
    required this.selectedSites,
    required this.onToggleSelectionMode,
    required this.onToggleSiteSelection,
    required this.onNavigateToSiteDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: filteredSites.length,
      itemBuilder: (context, index) {
        final site = filteredSites[index];
        final isSelected = selectedSites.contains(site);

        return SiteCard(
          isSelected: isSelected,
          site: site,
          isSelectionMode: isSelectionMode,
          onTap: isSelectionMode ? () => onToggleSiteSelection(site) : () => onNavigateToSiteDetails(site),
          onLongPress: () {
            if (!isSelectionMode) {
              onToggleSelectionMode();
              onToggleSiteSelection(site);
            }
          },
          onCheckboxChanged: (value) => onToggleSiteSelection(site),
        );
      },
    );
  }
}

class CircleDecoration extends StatelessWidget {
  const CircleDecoration({
    super.key,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.width,
    this.height,
    this.alpha,
  });

  final double? top, right, left, bottom, width, height, alpha;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      left: left,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLowest.withValues(alpha: alpha),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ConfirmExportButton extends StatelessWidget {
  final VoidCallback onExport;

  const ConfirmExportButton({super.key, required this.onExport});

  void _handleExport(BuildContext context) {
    Navigator.pop(context);

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Generating Excel file...'),
            ],
          ),
        ),
      ),
    );

    // Simulate export completion
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Theme.of(context).colorScheme.surfaceContainerLowest),
              const SizedBox(width: 8),
              const Text('Sites exported successfully'),
            ],
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Trigger state update in parent
      onExport();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handleExport(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: const Text('Export'),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sites Management',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SortByLabel extends StatelessWidget {
  const SortByLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sort by',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class FilterByGovernorateLabel extends StatelessWidget {
  const FilterByGovernorateLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Filter by Governorate',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class ApplyFilterAndSortButton extends StatelessWidget {
  final VoidCallback onApply;

  const ApplyFilterAndSortButton({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onApply(); // Call the provided callback function
        Navigator.pop(context); // Close the modal
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: const Text('Apply'),
    );
  }
}

class FilterAndSortLabel extends StatelessWidget {
  const FilterAndSortLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Filter & Sort',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class CustomBottomBarDecoration extends StatelessWidget implements PreferredSizeWidget {
  const CustomBottomBarDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(10);
}

class ResetFilterAndSortsButton extends StatelessWidget {
  final VoidCallback onReset;

  const ResetFilterAndSortsButton({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onReset,
      child: const Text('Reset All'),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('Cancel'),
    );
  }
}

class SitesNumber extends StatelessWidget {
  const SitesNumber({
    super.key,
    required this.filteredSites,
  });

  final List<SiteEntity> filteredSites;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total: ${filteredSites.length} sites',
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class NoSiteAvailableText extends StatelessWidget {
  const NoSiteAvailableText({
    super.key,
    required String searchQuery,
  }) : _searchQuery = searchQuery;

  final String _searchQuery;

  @override
  Widget build(BuildContext context) {
    return Text(
      _searchQuery.isNotEmpty ? 'No sites matching "$_searchQuery"' : 'No sites available',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.outlineVariant,
      ),
    );
  }
}

class NoSiteAvailableIcon extends StatelessWidget {
  const NoSiteAvailableIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search_off,
      size: 64,
      color: Theme.of(context).colorScheme.outlineVariant,
    );
  }
}

class SeeMoreDetailsIcon extends StatelessWidget {
  const SeeMoreDetailsIcon({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Icon(
        Icons.chevron_right,
        color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

class SiteCardBody extends StatelessWidget {
  const SiteCardBody({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SiteName(site: site),
          const SizedBox(height: 4),
          SiteGovernorateAndCode(site: site),
          const SizedBox(height: 4),
          SiteCityAreaStreet(site: site),
        ],
      ),
    );
  }
}

class ActionButtonList extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onApply;

  const ActionButtonList({
    super.key,
    required this.onReset,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ResetFilterAndSortsButton(onReset: onReset),
        const SizedBox(width: 8),
        ApplyFilterAndSortButton(onApply: onApply),
      ],
    );
  }
}

class SiteCityAreaStreet extends StatelessWidget {
  const SiteCityAreaStreet({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            '${site.city}, ${site.area}, ${site.street}',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class SiteGovernorateAndCode extends StatelessWidget {
  const SiteGovernorateAndCode({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SiteCode(site: site),
        const SizedBox(width: 8),
        SiteGovernorate(site: site),
      ],
    );
  }
}

class SiteGovernorate extends StatelessWidget {
  const SiteGovernorate({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        site.governorate,
        style: TextStyle(
          fontSize: 12,
           color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class SiteCode extends StatelessWidget {
  const SiteCode({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        site.code,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SiteName extends StatelessWidget {
  const SiteName({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Text(
      site.name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SiteFirstChar extends StatelessWidget {
  const SiteFirstChar({
    super.key,
    required this.site,
  });

  final SiteEntity site;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          site.name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

class CustomFlotingActionButton extends StatelessWidget {
  const CustomFlotingActionButton({
    super.key,
    required bool isSelectionMode,
  }) : _isSelectionMode = isSelectionMode;

  final bool _isSelectionMode;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isSelectionMode ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.addVisitedSite,
          );
        },
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        label: Text(
          'New Site',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

class SiteEntity {
  final String id;
  final String name;
  final String code;
  final String governorate;
  final String street;
  final String area;
  final String city;

  SiteEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.governorate,
    required this.street,
    required this.area,
    required this.city,
  });
}
