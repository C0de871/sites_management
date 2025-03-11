import 'package:flutter/material.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/custom_bottom_bar_decoration.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/flexible_space_bar_widget.dart';

class SliverAppBarWidget extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final List<Widget> appBarActions;

  const SliverAppBarWidget({
    super.key,
    required this.innerBoxIsScrolled,
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
      flexibleSpace: const FlexibleSpaceBarWidget(),
      actions: appBarActions,
      bottom: const CustomBottomBarDecoration(),
    );
  }
}
