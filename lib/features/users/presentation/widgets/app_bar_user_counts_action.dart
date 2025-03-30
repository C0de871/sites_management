// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/get_users/get_users_cubit.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';
import 'package:sites_management/features/users/presentation/widgets/user_counts_chip.dart';

class AppBarUserCountsAction extends StatelessWidget {
  const AppBarUserCountsAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        switch (state) {
          case GetUsersLoaded():
            return const UserCountsChip();
          case _:
            return Container();
        }
      },
    );
  }
}
