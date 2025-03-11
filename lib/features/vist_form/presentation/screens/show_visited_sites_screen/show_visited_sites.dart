import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/action_button_list.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/confirm_delete_button.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/confirm_export_button.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/custom_floting_action_button.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/filter_and_sort_label.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/filter_by_governorate_label.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/governorate_choices.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/show_visited_sites.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/site_list_and_filter_info_body.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/sliver_app_bar_widget.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/sort_by_choices.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/sort_by_label.dart';

class SitesListPage extends StatefulWidget {
  const SitesListPage({super.key});

  @override
  State<SitesListPage> createState() => _SitesListPageState();
}

class _SitesListPageState extends State<SitesListPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final showVisitedSiteCubit = context.read<ShowVisitedSiteCubit>();
    showVisitedSiteCubit.fetchSites();
    showVisitedSiteCubit.animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    showVisitedSiteCubit.animation = CurvedAnimation(
      parent: showVisitedSiteCubit.animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    final showVisitedSiteCubit = context.read<ShowVisitedSiteCubit>();
    showVisitedSiteCubit.animationController.dispose();
    super.dispose();
  }

  void _exportSelectedSites() {
    BuildContext parentContext = context;
    final showVisitedSiteCubit = parentContext.read<ShowVisitedSiteCubit>();
    showDialog(
      context: parentContext,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.file_download, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text('Export to Excel', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
        content: BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
          builder: (context, state) {
            final state = showVisitedSiteCubit.state as ShowVisitedSiteSuccess;
            return Text(
              'Do you want to export ${state.selectedSites.isEmpty ? "all" : state.selectedSites.length} sites to Excel?',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
            );
          },
        ),
        actions: [
          const DeleteButton(),
          ConfirmExportButton(
            onExport: showVisitedSiteCubit.toggleSelectionMode,
          ),
        ],
      ),
    );
  }

  void _deleteSelectedSites() {
    BuildContext parentContext = context;
    final showVisitedSiteCubit = parentContext.read<ShowVisitedSiteCubit>();
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
        content: BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
          builder: (context, state) {
            final state = showVisitedSiteCubit.state as ShowVisitedSiteSuccess;
            return Text(
              'Are you sure you want to delete ${state.selectedSites.length} selected site(s)?\nThis action cannot be undone.',
            );
          },
        ),
        actions: [
          const DeleteButton(),
          ConfirmDeleteButton(onPressed: showVisitedSiteCubit.confirmDelete),
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
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterAndSortLabel(),
            Divider(height: 32),
            FilterByGovernorateLabel(),
            SizedBox(height: 8),
            GovernorateChoices(),
            SizedBox(height: 24),
            SortByLabel(),
            SizedBox(height: 8),
            SortByChoices(),
            SizedBox(height: 24),
            ActionButtonList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBarWidget(
              innerBoxIsScrolled: innerBoxIsScrolled,
              appBarActions: _appBarActions(),
            )
          ];
        },
        body: const SiteListAndFilterInfoBody(),
      ),
      floatingActionButton: const CustomFlotingActionButton(),
    );
  }

  List<Widget> _appBarActions() {
    return [
      BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
        builder: (context, state) {
          if (state is ShowVisitedSiteSuccess) {
            return IconButton(
              icon: Icon(
                state.isSearchMode ? Icons.search_off : Icons.search,
              ),
              onPressed: context.read<ShowVisitedSiteCubit>().toggleSearchMode,
            );
          }
          return const SizedBox.shrink();
        },
      ),
      BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
        builder: (context, state) {
          if (state is ShowVisitedSiteSuccess) {
            if (state.isSelectionMode) {
              return IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                ),
                onPressed: state.selectedSites.isEmpty ? null : _deleteSelectedSites,
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
      BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
        builder: (context, state) {
          if (state is ShowVisitedSiteSuccess) {
            return IconButton(
              icon: Icon(
                state.isSelectionMode ? Icons.cancel : Icons.checklist,
              ),
              onPressed: context.read<ShowVisitedSiteCubit>().toggleSelectionMode,
            );
          }
          return const SizedBox.shrink();
        },
      ),
      BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
        builder: (context, state) {
          if (state is ShowVisitedSiteSuccess) {
            return IconButton(
              icon: const Icon(
                Icons.file_download,
              ),
              onPressed: _exportSelectedSites,
            );
          }
          return const SizedBox.shrink();
        },
      ),
      BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
        builder: (context, state) {
          if (state is ShowVisitedSiteSuccess) {
            return IconButton(
              icon: const Icon(
                Icons.filter_list,
              ),
              onPressed: _showFilterSortBottomSheet,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ];
  }
}
