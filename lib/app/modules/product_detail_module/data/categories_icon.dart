import 'package:clothers_store_app/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String icon;
  final String label;

  const CategoryIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Ensures the column takes only the required space
        children: [
          CircleAvatar(
            backgroundColor: Colors.brown[100],
            radius: 25,
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(icon),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 4),
          // Adjusting text styling and length for better layout
          Text(
            label,
            overflow: TextOverflow.ellipsis, // Prevents overflow by truncating text
            style: AppTextStyle.bodyText3SB(),
            textAlign: TextAlign.center, // Center text if needed
          ),
        ],
      ),
    );
  }
}
