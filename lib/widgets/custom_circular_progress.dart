import 'package:flutter/material.dart';
import 'package:life_counter/shared/app_colors.dart';

class CCircularProgressIndicator extends StatelessWidget {
  const CCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: AppColors.grey,
      color: AppColors.darkGrey,
    );
  }
}
