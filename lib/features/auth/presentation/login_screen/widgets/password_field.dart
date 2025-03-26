// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/auth/presentation/login_screen/cubits/login_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_text_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          "Password",
          suffixIcon: context.read<LoginCubit>().isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          icon: Icons.lock_outline,
          controller: context.read<LoginCubit>().passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          obsecure: !context.read<LoginCubit>().isPasswordVisible,
          onPressedSuffixIcon: context.read<LoginCubit>().togglePasswordVisibility,
        );
      },
    );
  }
}
