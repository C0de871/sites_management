import 'package:flutter/material.dart';

import '../../../../core/Routes/app_routes.dart';
import 'show_site_details.dart';

// MTN Colors
const mtnYellow = Color(0xFFFFD700);
const mtnDarkYellow = Color(0xFFFFB300);
const mtnLightYellow = Color(0xFFFFF9C4);

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
        title: const Row(
          children: [
            Icon(Icons.delete_forever, color: Colors.red),
            SizedBox(width: 8),
            Text('Delete Sites'),
          ],
        ),
        content: Text(
          'Are you sure you want to delete ${_selectedSites.length} selected site(s)?\nThis action cannot be undone.',
        ),
        actions: [
          const DeleteButton(),
          _confirmDeleteButton(context),
        ],
      ),
    );
  }

  ElevatedButton _confirmDeleteButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // In a real app, you would call your API to delete sites
        setState(() {
          _mockSites.removeWhere((site) => _selectedSites.contains(site));
          _selectedSites.clear();
          _isSelectionMode = false;
        });
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sites deleted successfully'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      child: const Text('Delete'),
    );
  }

  void _exportSelectedSites() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.file_download, color: mtnDarkYellow),
            SizedBox(width: 8),
            Text('Export to Excel'),
          ],
        ),
        content: Text(
          'Do you want to export ${_selectedSites.isEmpty ? "all" : _selectedSites.length} sites to Excel?',
        ),
        actions: [
          const DeleteButton(),
          _confirmExportButton(context),
        ],
      ),
    );
  }

  ElevatedButton _confirmExportButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
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
            const SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Sites exported successfully'),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
            ),
          );
          setState(() {
            _selectedSites.clear();
            _isSelectionMode = false;
          });
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: mtnDarkYellow,
        foregroundColor: Colors.black87,
      ),
      child: const Text('Export'),
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
              _governorateChoices(setModalState),
              const SizedBox(height: 24),
              const SortByLabel(),
              const SizedBox(height: 8),
              _sortByChoices(setModalState),
              const SizedBox(height: 24),
              _actionButtonList(setModalState, context),
            ],
          ),
        ),
      ),
    );
  }

  Row _actionButtonList(StateSetter setModalState, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _resetFilterAndSortsButton(setModalState),
        const SizedBox(width: 8),
        _applyFilterAndSortButton(context),
      ],
    );
  }

  ElevatedButton _applyFilterAndSortButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // Apply the filter and sort from modal state
          _filterByGovernorate = _filterByGovernorate;
          _currentSort = _currentSort;
        });
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: mtnDarkYellow,
        foregroundColor: Colors.black87,
      ),
      child: const Text('Apply'),
    );
  }

  TextButton _resetFilterAndSortsButton(StateSetter setModalState) {
    return TextButton(
      onPressed: () {
        setModalState(() {
          _filterByGovernorate = null;
          _currentSort = SortOption.nameAsc;
        });
      },
      child: const Text('Reset All'),
    );
  }

  Wrap _sortByChoices(StateSetter setModalState) {
    return Wrap(
      spacing: 8,
      children: [
        _buildSortChip(
          'Name (A-Z)',
          SortOption.nameAsc,
          setModalState,
        ),
        _buildSortChip(
          'Name (Z-A)',
          SortOption.nameDesc,
          setModalState,
        ),
        _buildSortChip(
          'Code (Low-High)',
          SortOption.codeAsc,
          setModalState,
        ),
        _buildSortChip(
          'Code (High-Low)',
          SortOption.codeDesc,
          setModalState,
        ),
      ],
    );
  }

  SizedBox _governorateChoices(StateSetter setModalState) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _allGovernorates.length,
        itemBuilder: (context, index) {
          final governorate = _allGovernorates[index];
          final isSelected = _filterByGovernorate == (governorate == 'All' ? null : governorate);

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(governorate),
              selected: isSelected,
              selectedColor: mtnYellow,
              onSelected: (selected) {
                setModalState(() {
                  _filterByGovernorate = selected ? (governorate == 'All' ? null : governorate) : null;
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSortChip(
    String label,
    SortOption sortOption,
    StateSetter setModalState,
  ) {
    return ChoiceChip(
      label: Text(label),
      selected: _currentSort == sortOption,
      selectedColor: mtnYellow,
      onSelected: (selected) {
        setModalState(() {
          if (selected) {
            _currentSort = sortOption;
          }
        });
      },
    );
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
            _sliverAppBar(innerBoxIsScrolled),
          ];
        },
        body: _siteListAndFilterInfoBody(filteredSites),
      ),
      floatingActionButton: CustomFlotingActionButton(isSelectionMode: _isSelectionMode),
    );
  }

  Container _siteListAndFilterInfoBody(List<SiteEntity> filteredSites) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.yellow[50]!,
          ],
        ),
      ),
      child: Column(
        children: [
          // Filter & stats info
          _filterAndStatsInfo(filteredSites),
          // Sites list
          _sitesListOrNotAvailable(filteredSites),
        ],
      ),
    );
  }

  Expanded _sitesListOrNotAvailable(List<SiteEntity> filteredSites) {
    return Expanded(
      child: filteredSites.isEmpty ? _noSiteAvailable() : _siteList(filteredSites),
    );
  }

  ListView _siteList(List<SiteEntity> filteredSites) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: filteredSites.length,
      itemBuilder: (context, index) {
        final site = filteredSites[index];
        final isSelected = _selectedSites.contains(site);

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _siteCard(isSelected, site),
        );
      },
    );
  }

  Card _siteCard(bool isSelected, SiteEntity site) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected ? const BorderSide(color: mtnDarkYellow, width: 2) : BorderSide.none,
      ),
      child: InkWell(
        onTap: _isSelectionMode ? () => _toggleSiteSelection(site) : () => _navigateToSiteDetails(site),
        onLongPress: () {
          if (!_isSelectionMode) {
            _toggleSelectionMode();
            _toggleSiteSelection(site);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      mtnLightYellow,
                      Colors.white,
                    ],
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (_isSelectionMode) _siteCheckBox(isSelected, site),
                SiteFirstChar(
                  site: site,
                ),
                const SizedBox(width: 16),
                SiteCardBody(
                  site: site,
                ),
                SeeMoreDetailsIcon(
                  isSelected: isSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _siteCheckBox(bool isSelected, SiteEntity site) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Checkbox(
        value: isSelected,
        activeColor: mtnDarkYellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onChanged: (value) => _toggleSiteSelection(site),
      ),
    );
  }

  Center _noSiteAvailable() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NoSiteAvailableIcon(),
          const SizedBox(height: 16),
          NoSiteAvailableText(searchQuery: _searchQuery),
          if (_searchQuery.isNotEmpty || _filterByGovernorate != null) _clearFilterButton(),
        ],
      ),
    );
  }

  TextButton _clearFilterButton() {
    return TextButton.icon(
      icon: const Icon(Icons.refresh),
      label: const Text('Clear filters'),
      onPressed: () {
        setState(() {
          _searchQuery = '';
          _searchController.clear();
          _filterByGovernorate = null;
        });
      },
    );
  }

  Padding _filterAndStatsInfo(List<SiteEntity> filteredSites) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SitesNumber(
            filteredSites: filteredSites,
          ),
          if (_filterByGovernorate != null) _filterChip(),
        ],
      ),
    );
  }

  Chip _filterChip() {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.filter_list, size: 16),
          const SizedBox(width: 4),
          Text(_filterByGovernorate!),
        ],
      ),
      backgroundColor: mtnLightYellow,
      deleteIcon: const Icon(Icons.close, size: 16),
      onDeleted: () {
        setState(() {
          _filterByGovernorate = null;
        });
      },
    );
  }

  SliverAppBar _sliverAppBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      floating: true,
      backgroundColor: mtnYellow,
      snap: true,
      forceElevated: innerBoxIsScrolled,
      flexibleSpace: _flexibleSpaceBar(),
      actions: _appBarActions(),
      bottom: const CustomBottomBarDecoration(),
    );
  }

  List<Widget> _appBarActions() {
    return [
      IconButton(
        icon: Icon(
          _isSearchMode ? Icons.search_off : Icons.search,
          color: Colors.black87,
        ),
        onPressed: _toggleSearchMode,
      ),
      if (_isSelectionMode)
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.black87),
          onPressed: _selectedSites.isEmpty ? null : _deleteSelectedSites,
        ),
      IconButton(
        icon: Icon(
          _isSelectionMode ? Icons.cancel : Icons.checklist,
          color: Colors.black87,
        ),
        onPressed: _toggleSelectionMode,
      ),
      IconButton(
        icon: const Icon(Icons.file_download, color: Colors.black87),
        onPressed: _exportSelectedSites,
      ),
      IconButton(
        icon: const Icon(Icons.filter_list, color: Colors.black87),
        onPressed: _showFilterSortBottomSheet,
      ),
    ];
  }

  FlexibleSpaceBar _flexibleSpaceBar() {
    return FlexibleSpaceBar(
      expandedTitleScale: 1,
      centerTitle: true,
      title: _isSearchMode ? _searchField() : const AppBarTitle(),
      background: const AppBarDecoratedContainer(),
    );
  }

  Align _searchField() {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedBuilder(
        animation: _animation,
        // axis: Axis.horizontal,
        builder: (context, child) {
          final width = MediaQuery.of(context).size.width * 0.7 * _animation.value;

          return SizedBox(
            width: width,

            // Use ClipRect to ensure content doesn't overflow during animation
            child: ClipRect(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search sites...',
                  hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.black54),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                  ),
                ),
                style: const TextStyle(color: Colors.black87, fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
          );
        },
      ),
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            mtnYellow,
            mtnDarkYellow,
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
          color: Colors.white.withValues(alpha: alpha),
          shape: BoxShape.circle,
        ),
      ),
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
        color: Colors.black87,
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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(10);
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
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
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
        color: Colors.grey[600],
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
      color: Colors.grey[400],
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
        color: isSelected ? mtnDarkYellow : Colors.grey,
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
        const Icon(
          Icons.location_on_outlined,
          size: 14,
          color: Colors.grey,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            '${site.city}, ${site.area}, ${site.street}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
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
        SfiteGovernorate(site: site),
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
          color: Colors.grey[600],
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
        color: mtnLightYellow,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        site.code,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
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
        color: mtnYellow.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          site.name.substring(0, 1).toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: mtnDarkYellow,
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
        backgroundColor: mtnDarkYellow,
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.addVisitedSite,
          );
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'New Site',
          style: TextStyle(color: Colors.white),
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
