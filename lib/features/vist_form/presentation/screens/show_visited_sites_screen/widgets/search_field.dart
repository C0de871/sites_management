import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowVisitedSiteCubit>();
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedBuilder(
        animation: cubit.animation,
        builder: (context, child) {
          final width = MediaQuery.of(context).size.width * 0.7 * cubit.animation.value;

          return SizedBox(
            width: width,
            child: ClipRect(
              child: TextField(
                controller: cubit.searchController,
                decoration: InputDecoration(
                  hintText: 'Search sites...',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                    ),
                    onPressed: cubit.deleteSearchQuery,
                  ),
                ),
                style: const TextStyle(fontSize: 16),
                onChanged: cubit.setSearchResult,
              ),
            ),
          );
        },
      ),
    );
  }
}
