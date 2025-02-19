import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_app/components/button/button.dart';
import 'package:wonderful_app/components/input/textfield.dart';
import 'package:wonderful_app/components/popup/popup.dart';
import 'package:wonderful_app/components/snackbar.dart';
import 'package:wonderful_app/routes/app_routes.dart';
import 'package:wonderful_app/utils/palindrome.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TextEditingController _usn = TextEditingController();
  final TextEditingController _sentence = TextEditingController();

  void checkPalindrome() {
    if (_sentence.text.isEmpty) {
      showCustomSnackBar(context, 'Please enter a sentence!');
      return;
    }
    String result = palindromeRes(_sentence.text.trim());
    showPopup(context: context, title: result, buttonTitle: 'Close');
  }

  void goToScreen2() {
    if (_usn.text.isEmpty) {
      showCustomSnackBar(context, 'Please enter a name!');
      return;
    }
    Get.toNamed(Routes.SCREEN2, arguments: {'usn': _usn.text});
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
                width: maxWidth,
                height: maxHeight,
              ),

              /// **Align content in the center of the screen**
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: maxHeight * 0.2),
                      Image(image: AssetImage('assets/images/ic_photo.png')),

                      SizedBox(height: maxHeight * 0.025),
                      CustomTextField(
                        textEditingController: _usn,
                        labelText: "Username",
                      ),

                      SizedBox(height: maxHeight * 0.02),
                      CustomTextField(
                        textEditingController: _sentence,
                        labelText: "Palindrome",
                      ),

                      SizedBox(height: maxHeight * 0.05),
                      CustomButton(
                        title: 'Check',
                        onPressed: () => checkPalindrome(),
                      ),
                      SizedBox(height: maxHeight * 0.02),
                      CustomButton(
                        title: 'Next',
                        onPressed: () => goToScreen2(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
