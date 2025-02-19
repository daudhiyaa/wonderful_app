import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_app/components/appbar.dart';
import 'package:wonderful_app/components/button/button.dart';
import 'package:wonderful_app/controller/user_controller.dart';
import 'package:wonderful_app/routes/app_routes.dart';
import 'package:wonderful_app/themes/colors.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final userController = Get.find<UserController>();
  final usn = Get.arguments['usn'] as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: 'Second Screen', centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 14, color: AppColors.textBlack),
            ),
            Text(
              usn,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            ),
            Spacer(),
            Center(
              child: Obx(
                () => Text(
                  userController.usn,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              onPressed: () => Get.toNamed(Routes.SCREEN3),
              title: 'Choose a User',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
