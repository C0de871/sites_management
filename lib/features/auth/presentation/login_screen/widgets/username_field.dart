// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/auth/presentation/login_screen/cubits/login_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_text_field.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      "Username",
      icon: Icons.person_outline,
      controller: context.read<LoginCubit>().usernameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
      // decoration: const InputDecoration(
      //   labelText: 'Username',
      //   hintText: 'Enter your username',
      //   prefixIcon: Icon(Icons.person_outline),
      // ),
      // onChanged: (value) {
      //   context.read<LoginCubit>().usernameChanged(value);
      // },
      // textInputAction: TextInputAction.next,
    );
  }
}
