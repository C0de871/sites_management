// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/features/users/presentation/widgets/empty_or_loading_or_users_list_view.dart';

class UsersManagementBody extends StatelessWidget {
  const UsersManagementBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // SizedBox(height: 16),
        // SearchUserBar(),
        SizedBox(height: 16),
        EmptyOrLoadingOrUsersListView(),
      ],
    );
  }
}
