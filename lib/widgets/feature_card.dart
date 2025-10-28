// lib/widgets/feature_card.dart

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color backgroundColor;
  final Widget? child;
  final VoidCallback onTap;
  final double height;
  final bool isPrimary; // Flag for the large, dark card

  const FeatureCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.backgroundColor,
    this.child,
    required this.onTap,
    this.height = 150.0,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonShadow,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isPrimary ? 30 : 20,
                  fontWeight: FontWeight.bold,
                  color: isPrimary ? AppColors.lightText : AppColors.darkText,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 14,
                    color: isPrimary ? AppColors.lightText.withOpacity(0.8) : Colors.grey[700],
                  ),
                ),
              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}