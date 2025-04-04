import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../visited_sites/presentation/screens/add_edit_visited_site_screen/add_visited_site.dart';
import 'cubits/login_cubit.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginFailure():
              ScaffoldMessenger.of(context).showSnackBar(
                FailedSnackBar(
                  message: state.errorMessage,
                ),
              );
            case LoginSuccess():
              ScaffoldMessenger.of(context).showSnackBar(
                SuccessSnackBar(
                  message: "Login successful",
                ),
              );
              Navigator.pushReplacementNamed(context, AppRoutes.homePage);
            case _:
              break;
          }
        },
        child: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginHeader(),
                SizedBox(height: 32),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
