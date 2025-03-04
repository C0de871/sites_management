import 'package:flutter/material.dart';

class MTNLogo extends StatelessWidget {
  const MTNLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF005495), // MTN Blue
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'MTN',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
