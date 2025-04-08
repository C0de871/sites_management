

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/models/message_model.dart';
import 'package:sites_management/core/shared/widgets/failed_snack_bar.dart';
import 'package:sites_management/core/shared/widgets/success_snack_bar.dart';
import 'package:sites_management/core/utils/commands/command.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/add_visited_site.dart';

import '../../../../../core/theme/app_theme.dart';
import 'cubit/get_visited_site_cubit.dart';
import 'widgets/custom_floting_action_button.dart';
import 'widgets/site_list_and_filter_info_body.dart';
import 'widgets/sliver_app_bar_widget.dart';

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


  @override
  Widget build(BuildContext context) {
    Theme.of(context).extension<ExtentionColors>()!.extendedColorScheme(context).ex;
    return MultiBlocListener(
      listeners: [
        BlocListener<Command<MessageModel>, CommandState<MessageModel>>(
          bloc: context.read<GetVisitedSitesCubit>().deleteCommand,
          listener: (context, state) {
            switch (state) {
              case CommandLoading():
               Navigator.pop(context);
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
                          Text('Deleting sites...'),
                        ],
                      ),
                    ),
                  ),
                );
              case CommandSuccess():
                ScaffoldMessenger.of(context).showSnackBar(SuccessSnackBar(message: state.data?.message ?? ''));
                Navigator.pop(context);
                break;
              case CommandFailure():
                ScaffoldMessenger.of(context).showSnackBar(FailedSnackBar(message: state.error));
                Navigator.pop(context);
                break;
            }
          },
        ),
        BlocListener<Command<MessageModel>, CommandState<MessageModel>>(
          bloc: context.read<GetVisitedSitesCubit>().exportCommand,
          listener: (context, state) {
            switch (state) {
              case CommandLoading():
                Navigator.pop(context);
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
              case CommandSuccess():
                ScaffoldMessenger.of(context).showSnackBar(SuccessSnackBar(message: state.data?.message ?? ''));
                Navigator.pop(context);
                break;
              case CommandFailure():
                ScaffoldMessenger.of(context).showSnackBar(FailedSnackBar(message: state.error));
                Navigator.pop(context);
                break;
            }
          },
        ),
      ],
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBarWidget(
                innerBoxIsScrolled: innerBoxIsScrolled,
              )
            ];
          },
          body: const SiteListAndFilterInfoBody(),
        ),
        floatingActionButton: const CustomFlotingActionButton(),
      ),
    );
  }
}
