import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_state.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/app_bar_decorated_container.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/app_bar_title.dart';
import 'package:sites_management/features/vist_form/presentation/screens/show_visited_sites_screen/widgets/search_field.dart';

class FlexibleSpaceBarWidget extends StatelessWidget {
  const FlexibleSpaceBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: 1,
      centerTitle: true,
      title: BlocBuilder<ShowVisitedSiteCubit, ShowVisitedSiteState>(
        builder: (context, state) {
          if (state is ShowVisitedSiteSuccess) {
            return state.isSearchMode ? const SearchField() : const AppBarTitle();
          }
          return const AppBarTitle();
        },
      ),
      background: const AppBarDecoratedContainer(),
    );
  }
}
