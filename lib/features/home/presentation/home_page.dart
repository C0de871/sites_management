import 'package:flutter/material.dart';
import 'package:sites_management/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:sites_management/features/home/presentation/widgets/page_body.dart';
import 'package:sites_management/features/home/presentation/widgets/page_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: const Column(
          children: [
            PageTitle(),
            PageBody(),
          ],
        ),
      ),
    );
  }
}
