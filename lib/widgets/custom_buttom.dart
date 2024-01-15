import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.text,
      this.width,
      this.height,
      this.onPressed,
      this.backgroundColor = AppColors.darkGrey,
      this.textColor = Colors.white,
      this.fontSize = 12,
      this.buttonColor,
      this.textPadding = true,
      super.key});

  final void Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final Color? buttonColor;
  final bool textPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: textPadding
                  ? const EdgeInsets.symmetric(horizontal: 15)
                  : EdgeInsets.zero,
              disabledBackgroundColor: AppColors.lightGrey,
              backgroundColor: buttonColor ?? backgroundColor,
              side: const BorderSide(
                  width: 2, // the thickness
                  color: AppColors.lightGrey // the color of the border
                  ),
            ),
            child: Text(text,
                style: TextStyle(
                    color: onPressed == null ? Colors.white : textColor,
                    fontSize: fontSize)),
          )),
    );
  }
}
