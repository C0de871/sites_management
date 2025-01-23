import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/Routes/app_routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<CheckFirstLaunchCubit>().checkFirstLaunch();
    Future.delayed(const Duration(seconds: 2)).then((a) {
      log("delay done");
      if (context.mounted) {
        log("context is mounted");
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.homePage,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log("in the loading screen build method");
    return const Scaffold(
      body: SizedBox(),
      // body: MultiBlocListener(
      //   listeners: [
      //     BlocListener<CheckFirstLaunchCubit, CheckFirstLaunchState>(
      //       listener: (context, state) async {
      //         if (state is CheckFirstLaunchLoaded) {
      //           if (state.isFirstLaunch) {
      //             await Future.delayed(const Duration(seconds: 2));
      //             if (context.mounted) {
      //               Navigator.pushReplacementNamed(
      //                   context, AppRoutes.splashRoute);
      //             }
      //           } else {
      //             context.read<GetLastUserCubit>().getLastUser();
      //           }
      //         }
      //       },
      //     ),
      //     BlocListener<GetLastUserCubit, GetLastUserState>(
      //       listener: (context, state) async {
      //         if (state is UserLoaded) {
      //           await Future.delayed(const Duration(seconds: 5));
      //           if (context.mounted) {
      //             Navigator.pushReplacementNamed(context, AppRoutes.usersRoute);
      //           }
      //         } else if (state is NoUserFound) {
      //           await Future.delayed(const Duration(seconds: 5));
      //           if (context.mounted) {
      //             Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
      //           }
      //         }
      //       },
      //     ),
      //   ],
      //   child: const Center(
      //     // child: Lottie.asset('assets/lottie/motor.json'),
      //   ),
      // ),
    );
  }
}
