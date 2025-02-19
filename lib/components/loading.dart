import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String? text;
  final double width, height;
  const Loading({
    super.key,
    this.text,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: text != null ? 16 : 0),
          if (text != null) Text(text!),
        ],
      ),
    );
  }
}
