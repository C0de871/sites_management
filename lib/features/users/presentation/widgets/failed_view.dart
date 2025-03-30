// models/user.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/users/presentation/cubits/get_users/get_users_cubit.dart';

class FailedView extends StatelessWidget {
  const FailedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<GetUsersCubit>().state as GetUsersFailed;
    return Expanded(
      child: Center(
        child: Text(
          state.message,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
