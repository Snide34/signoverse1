// lib/widgets/onboarding_nav_button.dart

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class OnboardingNavButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isFinalPage;

  const OnboardingNavButton({
    super.key,
    required this.onTap,
    this.isFinalPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary, // Dark Teal/Green background
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonShadow,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          // Use the appropriate icon based on the page status
          isFinalPage ? Icons.check : Icons.chevron_right,
          color: AppColors.lightText,
          size: 30,
        ),
      ),
    );
  }
}