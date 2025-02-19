import 'package:flutter/material.dart';
import 'package:wonderful_app/themes/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double elevation;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.elevation = 0,
    this.buttonColor = AppColors.primary,
    this.textColor = AppColors.textWhite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(elevation),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return buttonColor.withAlpha(200);
            }
            return buttonColor;
          }),
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 12.0),
          ),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
