import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  bool get isNetwork => image.startsWith('http');

  bool get isPngOrJpg => image.toLowerCase().endsWith('.png') || image.toLowerCase().endsWith('.jpg') || image.toLowerCase().endsWith('.jpeg');

  @override
  Widget build(BuildContext context) {
    Widget child;

     if (isNetwork) {
      child = Image.network(
        image,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
      );
    } else if (isPngOrJpg) {
      child = Image.asset(image, width: width, height: height, fit: fit);
    } else {
      child = const Icon(Icons.image_not_supported);
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
