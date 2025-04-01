// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/get_users/get_users_cubit.dart';
import 'package:sites_management/features/users/presentation/widgets/empty_or_users_list_view.dart';
import 'package:sites_management/features/users/presentation/widgets/failed_view.dart';
import 'package:sites_management/features/users/presentation/widgets/loading_users_view.dart';

class EmptyOrLoadingOrUsersListView extends StatelessWidget {
  const EmptyOrLoadingOrUsersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        switch (state) {
          case GetUsersLoading():
            return const LoadingUsersView();
          case GetUsersLoaded():
            return const EmptyOrUsersListView();
          case GetUsersFailed():
            return const FailedView();
          case _:
            return Container();
        }
      },
    );
  }
}
