import 'package:flutter/material.dart';
import 'package:wonderful_app/themes/colors.dart';

class UnderlineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final Color labelColor;
  final IconData icon;
  final bool enabled;
  final void Function(String)? onChanged;

  const UnderlineTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.labelText,
    this.labelColor = Colors.grey,
    required this.icon,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          onChanged: onChanged,
          enabled: enabled,
          style: const TextStyle(
            color: AppColors.textBlack,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: labelColor,
              fontWeight: FontWeight.bold,
            ),
            hintText: hintText,
            prefixIcon: Icon(icon, color: AppColors.primary500),
            border: InputBorder.none,
          ),
        ),
        Container(height: 1.0, color: AppColors.dark),
      ],
    );
  }
}
