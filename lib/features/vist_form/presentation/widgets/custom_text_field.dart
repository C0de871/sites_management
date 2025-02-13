import 'package:flutter/material.dart';

import '../visit_form.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
    this.label, {
    super.key,
    required this.icon,
    this.isNumber,
    required this.controller,
  });

  final String label;
  final IconData icon;
  final bool? isNumber;
  final TextEditingController controller;

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
        keyboardType: widget.isNumber ?? false ? TextInputType.number : TextInputType.text,
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
