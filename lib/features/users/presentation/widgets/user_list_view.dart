// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/get_users/get_users_cubit.dart';
import 'package:sites_management/features/users/presentation/widgets/user_card.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    final users = (context.read<GetUsersCubit>().state as GetUsersLoaded).getUserEntity.users;
    return AnimatedList(
      initialItemCount: users.length,
      itemBuilder: (context, index, animation) {
        final user = users[index];
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: UserCard(user: user),
        );
      },
    );
  }
}
