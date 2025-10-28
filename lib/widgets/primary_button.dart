// lib/widgets/primary_button.dart

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Fills the width
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
          elevation: 4, // Subtle shadow
          shadowColor: AppColors.buttonShadow,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.lightText,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}