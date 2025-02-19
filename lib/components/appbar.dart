import 'package:flutter/material.dart';
import 'package:wonderful_app/components/button/back_button.dart';
import 'package:wonderful_app/themes/colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool centerTitle;

  const BaseAppBar({
    super.key,
    required this.title,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 18,
    this.leading = const CustomBackButton(),
    this.backgroundColor = AppColors.textWhite,
    this.elevation = 0,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            letterSpacing: 0,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: elevation,
        scrolledUnderElevation: 0,
        centerTitle: centerTitle,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: AppColors.textLightGray, height: 1),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
