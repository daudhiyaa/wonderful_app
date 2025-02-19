import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_app/components/button/button.dart';
import 'package:wonderful_app/themes/colors.dart';

void showPopup({
  required BuildContext context,
  String? image,
  required String title,
  String? subtitle,
  void Function()? onPressed,
  required String buttonTitle,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.primary50,
        content: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (image != null) Image.asset(image),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (subtitle != null)
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 14,
                  ),
                ),
              const SizedBox(height: 16),
              CustomButton(onPressed: Get.back, title: buttonTitle),
            ],
          ),
        ),
      );
    },
  );
}
