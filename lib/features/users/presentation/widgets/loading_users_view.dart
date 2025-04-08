// models/user.dart

import 'package:flutter/material.dart';
// import 'package:sites_management/features/users/presentation/users_screen.dart';

class LoadingUsersView extends StatelessWidget {
  const LoadingUsersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
