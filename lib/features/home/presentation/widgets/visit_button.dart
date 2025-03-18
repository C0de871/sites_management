import 'package:flutter/material.dart';

class VisitButton extends StatelessWidget {
  const VisitButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.press,
  });

  final String text;
  final IconData icon;
  final MaterialColor color;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: text,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color[300]!,
              color[400]!,
              color[500]!,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: color[700],
            onTap: press,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
