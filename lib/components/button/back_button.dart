import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_app/themes/colors.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isCustomCallback;

  const CustomBackButton({
    super.key,
    this.onPressed,
    this.isCustomCallback = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: const Icon(Icons.arrow_back_ios, color: AppColors.button),
      ),
      onPressed: !isCustomCallback ? () => Get.back() : onPressed,
    );
  }
}
