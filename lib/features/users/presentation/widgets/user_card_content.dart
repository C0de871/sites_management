// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';
import 'package:sites_management/features/users/presentation/widgets/edit_user_bottom_sheet.dart';
import 'package:sites_management/features/users/presentation/widgets/user_card_body.dart';
import 'package:sites_management/features/users/presentation/widgets/user_card_leading.dart';
import 'package:sites_management/features/users/presentation/widgets/user_card_trailing.dart';

class UserCardContent extends StatelessWidget {
  final UserEntity user;

  const UserCardContent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchEditBottomSheet(context),
      child: Hero(
        tag: 'user-${user.id}',
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                UserCardLeading(user: user),
                const SizedBox(width: 16),
                UserCardBody(user: user),
                UserCardTrailing(
                  user: user,
                  onTap: () => launchEditBottomSheet(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launchEditBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: parentContext.read<UpdateAddUserCubit>(),
        child: EditUserBottomSheet(user: user),
      ),
    );
  }
}
