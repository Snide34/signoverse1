// lib/widgets/dictionary_grid_item.dart

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DictionaryGridItem extends StatelessWidget {
  final String letter;
  final String imagePath;
  final VoidCallback onTap;

  const DictionaryGridItem({
    super.key,
    required this.letter,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular background for the sign image
          Container(
            width: 70, // Adjust size as needed
            height: 70, // Adjust size as needed
            decoration: BoxDecoration(
              color: AppColors.secondary, // Light mint/gray from your design
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Letter label
          Text(
            letter,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}