import 'package:flutter/material.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/widgets/circle_decoration.dart';

class AppBarDecoratedContainer extends StatelessWidget {
  const AppBarDecoratedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.inversePrimary,
          ],
        ),
      ),
      child: const Stack(
        children: [
          CircleDecoration(
            top: -50,
            right: -50,
            width: 200,
            height: 200,
            alpha: 0.3,
          ),
          CircleDecoration(
            left: -30,
            bottom: -30,
            width: 120,
            height: 120,
            alpha: 0.3,
          ),
        ],
      ),
    );
  }
}
