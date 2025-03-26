import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/credit_dialoge.dart';

class CreditButton extends StatelessWidget {
  const CreditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        alignment: Alignment.centerLeft,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.info_outline,
          color: Colors.deepOrange,
        ),
        tooltip: 'Credits',
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const CreditsDialog(),
          );
        },
      ),
    );
  }
}
