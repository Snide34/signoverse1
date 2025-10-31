// lib/widgets/custom_text_field.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text, required String initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelText: labelText,
          // Outline border matching the clean design style
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          // Focused border when the user taps
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor, // Uses AppColors.primary
              width: 2.0,
            ),
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}