import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

// Placeholder for the Language Courses Screen
class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.darkPrimary,
        title: Text('Language Courses', style: TextStyle(color: AppColors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Course list coming soon!',
            style: TextStyle(
                fontSize: 24,
                color: AppColors.darkText,
                fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
