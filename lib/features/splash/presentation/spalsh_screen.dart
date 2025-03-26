import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/auth/presentation/login_screen/cubits/login_cubit.dart';

import '../../../core/Routes/app_routes.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.homePage,
          );
        } else if (state is LoginFailure) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      },
      builder: (context, state) {
        switch (state) {
          case LoginLoading():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case _:
            return Container();
        }
      },
    ));
  }
}
