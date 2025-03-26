import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import 'cubit/get_visited_site_cubit.dart';
import 'cubit/get_visited_site_state.dart';
import 'widgets/action_button_list.dart';
import 'widgets/confirm_delete_button.dart';
import 'widgets/confirm_export_button.dart';
import 'widgets/custom_floting_action_button.dart';
import 'widgets/delete_button.dart';
import 'widgets/filter_and_sort_label.dart';
import 'widgets/filter_by_governorate_label.dart';
import 'widgets/governorate_choices.dart';
import 'widgets/site_list_and_filter_info_body.dart';
import 'widgets/sliver_app_bar_widget.dart';
import 'widgets/sort_by_choices.dart';
import 'widgets/sort_by_label.dart';

class SitesListPage extends StatefulWidget {
  const SitesListPage({super.key});

  @override
  State<SitesListPage> createState() => _SitesListPageState();
}

class _SitesListPageState extends State<SitesListPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final showVisitedSiteCubit = context.read<GetVisitedSitesCubit>();
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

  void _exportSelectedSites() {
    BuildContext parentContext = context;
    final showVisitedSiteCubit = parentContext.read<GetVisitedSitesCubit>();
    showDialog(
      context: parentContext,
      builder: (context) => BlocProvider.value(
        value: showVisitedSiteCubit,
        child: AlertDialog(
          title: Row(
            children: [
              Icon(Icons.file_download, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text('Export to Excel', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            ],
          ),
          content: BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
            builder: (context, state) {
              final state = showVisitedSiteCubit.state as GetVisitedSiteSuccess;
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
      ),
    );
  }

  void _deleteSelectedSites() {
    BuildContext parentContext = context;
    final showVisitedSiteCubit = parentContext.read<GetVisitedSitesCubit>();
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: showVisitedSiteCubit,
        child: AlertDialog(
          title: Row(
            children: [
              Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 8),
              const Text('Delete Sites'),
            ],
          ),
          content: BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
            builder: (context, state) {
              final state = showVisitedSiteCubit.state as GetVisitedSiteSuccess;
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
      ),
    );
  }

  void _showFilterSortBottomSheet() {
    BuildContext parentContext = context;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => BlocProvider.value(
        value: parentContext.read<GetVisitedSitesCubit>(),
        child: Container(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).extension<ExtentionColors>()!.extendedColorScheme(context).ex;
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
      BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
        builder: (context, state) {
          if (state is GetVisitedSiteSuccess) {
            return IconButton(
              icon: Icon(
                state.isSearchMode ? Icons.search_off : Icons.search,
              ),
              onPressed: context.read<GetVisitedSitesCubit>().toggleSearchMode,
            );
          }
          return const SizedBox.shrink();
        },
      ),
      BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
        builder: (context, state) {
          if (state is GetVisitedSiteSuccess) {
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
      BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
        builder: (context, state) {
          if (state is GetVisitedSiteSuccess) {
            return IconButton(
              icon: Icon(
                state.isSelectionMode ? Icons.cancel : Icons.checklist,
              ),
              onPressed: context.read<GetVisitedSitesCubit>().toggleSelectionMode,
            );
          }
          return const SizedBox.shrink();
        },
      ),
      BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
        builder: (context, state) {
          if (state is GetVisitedSiteSuccess) {
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
      BlocBuilder<GetVisitedSitesCubit, GetVisitedSitesState>(
        builder: (context, state) {
          if (state is GetVisitedSiteSuccess) {
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
