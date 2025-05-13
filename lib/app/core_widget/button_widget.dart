import 'package:clothers_store_app/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final Color color;
  final double radius;
  final double? widthSize;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.color = primaryColor,
    this.radius = 30.0,
    this.widthSize,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: color)),
    )
        : Container(
      width: widthSize ?? Get.width,
          height: height,
          margin: margin ?? EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
                style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: onPressed,
                child: Text(text, style: const TextStyle(color: Colors.white)),
              ),
        );
  }
}
