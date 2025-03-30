// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/get_users/get_users_cubit.dart';

class UserCountsChip extends StatelessWidget {
  const UserCountsChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        switch (state) {
          case GetUsersLoaded():
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Chip(
                label: Text(
                  '${state.getUserEntity.users.length} Users',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            );
          case _:
            return Container();
        }
      },
    );
  }
}
