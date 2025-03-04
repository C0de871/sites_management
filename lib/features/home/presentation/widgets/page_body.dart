import 'package:flutter/material.dart';
import 'package:sites_management/core/Routes/app_routes.dart';
import 'package:sites_management/features/home/presentation/widgets/visit_button.dart';

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
          ],
        ),
      ),
    );
  }
}
