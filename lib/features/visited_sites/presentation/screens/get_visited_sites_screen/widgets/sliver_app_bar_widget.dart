import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/get_visited_site_cubit.dart';
import '../cubit/get_visited_site_state.dart';
import 'action_button_list.dart';
import 'cancel_button.dart';
import 'confirm_delete_button.dart';
import 'confirm_export_button.dart';
import 'custom_bottom_bar_decoration.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/widgets/flexible_space_bar_widget.dart';

import 'filter_and_sort_label.dart';
import 'filter_by_governorate_label.dart';
import 'governorate_choices.dart';
import 'sort_by_choices.dart';
import 'sort_by_label.dart';

class SliverAppBarWidget extends StatefulWidget {
  final bool innerBoxIsScrolled;

  const SliverAppBarWidget({
    super.key,
    required this.innerBoxIsScrolled,
  });

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
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
          actions: const [
            CancelButton(),
            ConfirmExportButton(),
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
            const CancelButton(),
            ConfirmDeleteButton(onPressed: () {
              showVisitedSiteCubit.deleteCommand.execute();
            }),
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
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      floating: true,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      snap: true,
      forceElevated: widget.innerBoxIsScrolled,
      flexibleSpace: const FlexibleSpaceBarWidget(),
      actions: _appBarActions(),
      bottom: const CustomBottomBarDecoration(),
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
