import 'package:flutter/material.dart';
import 'package:wonderful_app/themes/colors.dart';

class ButtonLoginWithGoogle extends StatelessWidget {
  const ButtonLoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement OAuth Google Sign In
      },
      // icon: const FaIcon(FontAwesomeIcons.google, color: BecaturColors.primary500),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/google_icon.png', width: 20, height: 20),
          const SizedBox(width: 10),
          const Text(
            'Masuk menggunakan Google',
            style: TextStyle(color: AppColors.textBlack, fontSize: 13),
          ),
        ],
      ),
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0.0),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          return Colors.transparent;
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 12.0),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: AppColors.textGray, // Border color
            ),
          ),
        ),
      ),
    );
  }
}
