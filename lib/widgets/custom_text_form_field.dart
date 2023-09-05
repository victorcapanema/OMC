import 'package:flutter/material.dart';
import 'package:life_counter/shared/app_colors.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField(
      {required this.name,
      this.validator,
      this.controller,
      this.isEnabled = true,
      this.onPressed,
      this.onChanged,
      this.haveSuffixIcon = false,
      this.onEditingComplete,
      Key? key})
      : super(key: key);
  final String name;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isEnabled;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final bool haveSuffixIcon;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(color: AppColors.grey),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        enabled: isEnabled,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: haveSuffixIcon
              ? IconButton(
                  onPressed: onPressed, icon: Icon(Icons.search, color: isEnabled ? AppColors.grey : Colors.yellow))
              : null,
          hintText: '$name name',
          hintStyle: const TextStyle(color: AppColors.grey),
          labelStyle: const TextStyle(color: AppColors.grey),
          enabledBorder: cOutlineInputBorder(AppColors.grey),
          focusedBorder: cOutlineInputBorder(AppColors.grey),
          disabledBorder: cOutlineInputBorder(Colors.yellow),
          errorBorder: cOutlineInputBorder(Colors.orange),
          focusedErrorBorder: cOutlineInputBorder(Colors.orange),
        ));
  }
}

InputBorder? cOutlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
      borderSide: BorderSide(width: 1.5, color: borderColor), borderRadius: BorderRadius.circular(10));
}
