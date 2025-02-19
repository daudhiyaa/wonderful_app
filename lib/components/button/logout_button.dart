import 'package:flutter/material.dart';
import 'package:wonderful_app/components/button/button.dart';
import 'package:wonderful_app/themes/colors.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Keluar",
      onPressed: () {
        // TODO: Implement logout function
      },
      buttonColor: AppColors.textError,
      textColor: AppColors.textWhite,
    );
  }
}
