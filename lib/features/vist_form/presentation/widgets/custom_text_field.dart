import 'package:flutter/material.dart';

import '../screens/add_visited_site.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
    this.label, {
    super.key,
    required this.icon,
    this.isNumber = false,
    required this.controller,
    this.validator,
  });

  final String label;
  final IconData icon;
  final bool isNumber;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: Icon(widget.icon, color: mtnDarkYellow),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: mtnDarkYellow),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
