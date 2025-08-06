import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
      items: items
          .map((item) => DropdownMenuItem(
              value: item, child: Text(item, style: const TextStyle(fontSize: 16))))
          .toList(),
      onChanged: onChanged,
    );
  }
}
