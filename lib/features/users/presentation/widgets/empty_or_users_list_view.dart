// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/get_users/get_users_cubit.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';
import 'package:sites_management/features/users/presentation/widgets/empty_users_view.dart';
import 'package:sites_management/features/users/presentation/widgets/enhanced_user_list_view.dart';

class EmptyOrUsersListView extends StatelessWidget {
  const EmptyOrUsersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<GetUsersCubit>().state as GetUsersLoaded;
    return Expanded(
      child: state.getUserEntity.users.isEmpty ? const EmptyUsersView() : EnhancedUserListView(users: state.getUserEntity.users),
    );
  }
}
