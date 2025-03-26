import 'package:flutter/material.dart';
import 'app_bar_title.dart';
import 'm_t_n_logo.dart';

import 'credit_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFD700), // MTN Yellow
            Color(0xFFFFED4A),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              CreditButton(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AppBarTitle(),
                      ),
                    ),
                    SizedBox(width: 12),
                    MTNLogo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
