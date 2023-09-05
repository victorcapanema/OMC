import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class RuleTile extends StatelessWidget {
  const RuleTile({required this.date, required this.rule, this.index = 0, super.key});

  final String date;
  final String rule;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: index % 2 == 0 ? AppColors.darkGrey : AppColors.lightGrey),
      child: Row(
        children: [
          Text(date, style: const TextStyle(color: AppColors.grey)),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: Text(rule, style: const TextStyle(color: AppColors.grey, height: 1.5)))
        ],
      ),
    );
  }
}
