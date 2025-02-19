import 'package:flutter/material.dart';
import 'package:wonderful_app/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final Color iconColor;
  final Color labelTextColor;
  final TextEditingController textEditingController;
  final double fontSize;
  final Widget? suffixIcon;
  final bool obsecureText, enableSuggestion, autoCorrect;
  final TextInputType keyboardType;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.labelText,
    this.onChanged,
    required this.textEditingController,
    this.icon,
    this.iconColor = AppColors.primary500,
    this.labelTextColor = AppColors.textLightGray,
    this.fontSize = 15,
    this.suffixIcon,
    this.obsecureText = false,
    this.enableSuggestion = true,
    this.autoCorrect = true,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textWhite,
      ),
      child: TextField(
        controller: textEditingController,
        obscureText: obsecureText,
        enableSuggestions: enableSuggestion,
        autocorrect: autoCorrect,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscuringCharacter: "*",
        enabled: enabled,
        style: TextStyle(
          fontFamily: 'MaisonNeue',
          color: AppColors.textBlack,
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon, color: iconColor) : null,
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelTextColor,
            fontSize: fontSize,
            fontFamily: 'MaisonNeue',
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
