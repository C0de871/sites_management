// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/get_users/get_users_cubit.dart';
import 'package:sites_management/features/users/presentation/widgets/failed_view.dart';
import 'package:sites_management/features/users/presentation/widgets/loading_users_view.dart';

import 'empty_users_view.dart';
import 'enhanced_user_list_view.dart';

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
          case GetUsersLoaded() when state.getUserEntity.users.isEmpty:
            return const Expanded(child: EmptyUsersView());
          case GetUsersLoaded():
            return Expanded(child: EnhancedUserListView(users: state.getUserEntity.users));
          case GetUsersFailed(message: var message):
            return FailedView(message: message);
          case _:
            return Container();
        }
      },
    );
  }
}
