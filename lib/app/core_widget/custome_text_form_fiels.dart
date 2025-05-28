import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final  Function()? onTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: primaryColor),
        ),
        hintStyle: AppTextStyle.bodyText4SB(),
        contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
      ),
      readOnly: readOnly ,
      onTap: onTap ,
    );
  }
}
