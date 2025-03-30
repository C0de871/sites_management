import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/home/presentation/cubits/home_cubit.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../../core/shared/enums/user_role.dart';
import 'visit_button.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            VisitButton(
              text: "زيارة استلام محطة",
              icon: Icons.radio_button_checked,
              color: Colors.orange,
              press: () {
                Navigator.of(context).pushNamed(AppRoutes.showVisitedSites);
              },
            ),
            VisitButton(
              text: "زيارة دورية للمولدة",
              icon: Icons.settings,
              color: Colors.green,
              press: () {},
            ),
            VisitButton(
              text: "زيارة دورية للمحطة",
              icon: Icons.cell_tower,
              color: Colors.blue,
              press: () {},
            ),
            VisitButton(
              text: "زيارة طارئة للمولدة",
              icon: Icons.warning_rounded,
              color: Colors.red,
              press: () {},
            ),
            VisitButton(
              text: "زيارة طارئة للمحطة",
              icon: Icons.cell_tower_outlined,
              color: Colors.purple,
              press: () {},
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                switch (state) {
                  case HomeSuccess() when state.role == UserRole.MANAGER:
                    return VisitButton(
                      text: "المستخدمين",
                      icon: Icons.person_2_outlined,
                      color: Colors.blueGrey,
                      press: () {},
                    );
                  case _:
                    return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
