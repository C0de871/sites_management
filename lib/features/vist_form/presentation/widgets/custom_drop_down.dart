import 'package:flutter/material.dart';
import '../screens/add_visited_site.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.dropDownList,
    required this.selectedValue,
    required this.onChanged,
    this.validator,
  });
  final List<String> dropDownList;
  final String? selectedValue;
  final String? Function(String? value)? validator;
  final void Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
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
      items: dropDownList.map((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        onChanged(value);
      },
      validator: validator,
    );
  }
}
