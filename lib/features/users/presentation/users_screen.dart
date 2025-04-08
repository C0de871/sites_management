// models/user.dart
import 'package:flutter/material.dart';
import 'package:sites_management/features/users/presentation/widgets/add_user_floating_button.dart';
import 'package:sites_management/features/users/presentation/widgets/app_bar_title.dart';
import 'package:sites_management/features/users/presentation/widgets/app_bar_user_counts_action.dart';
import 'package:sites_management/features/users/presentation/widgets/users_management_body.dart';

class UsersManagementScreen extends StatelessWidget {
  const UsersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: const [
          AppBarUserCountsAction(),
        ],
      ),
      body: const UsersManagementView(),
      floatingActionButton: const AddUserFloatingButton(),
    );
  }
}
