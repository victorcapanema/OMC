import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {

  static TextStyle blackCounter(double blurRadius,{double fontSize = 60}) {
    return TextStyle(
      shadows: [
        Shadow(color: Colors.white, offset: const Offset(3, 4), blurRadius: blurRadius),
      ],
      fontSize: fontSize,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle whiteCounter(double blurRadius,{double fontSize = 60}) {
    return TextStyle(
      shadows: [
        Shadow(color: Colors.black, offset: const Offset(3, 4), blurRadius: blurRadius),
      ],
      fontSize: fontSize,
      color: AppColors.iceWhite,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleSelector(String textColor, double contrastValue, double fontSize) {
    return textColor == '1'
        ? TextStyles.whiteCounter(contrastValue, fontSize: fontSize)
        : TextStyles.blackCounter(contrastValue, fontSize: fontSize);
  }
}
