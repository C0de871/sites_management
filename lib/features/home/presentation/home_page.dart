import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/auth/presentation/login_screen/cubits/login_cubit.dart';
import '../../../core/Routes/app_routes.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/page_body.dart';
import 'widgets/page_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LogoutSuccess():
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          default:
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.yellow[50]!,
                Colors.white,
                Colors.yellow[50]!,
              ],
            ),
          ),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              switch (state) {
                case LoginLoading():
                  log("loading...");
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case LoginSuccess():
                  return const Column(
                    children: [
                      PageTitle(),
                      PageBody(),
                    ],
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
// هي اسماء الرولات 
// employee
// mtn_account
// sites_admin
// manager