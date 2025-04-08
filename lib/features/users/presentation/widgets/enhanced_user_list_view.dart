// models/user.dart

import 'package:flutter/material.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/presentation/widgets/list_item_animation.dart';
import 'package:sites_management/features/users/presentation/widgets/user_card.dart';

class EnhancedUserListView extends StatelessWidget {
  final List<UserEntity> users;

  const EnhancedUserListView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListItemAnimation(
          index: index,
          child: UserCard(user: user), //todo
        );
      },
    );
  }
}
