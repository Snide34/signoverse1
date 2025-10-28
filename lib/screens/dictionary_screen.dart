// lib/screens/dictionary_screen.dart

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/dictionary_item.dart';
import '../widgets/dictionary_grid_item.dart';
import '../widgets/app_navigation_bar.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the custom navigation bar for consistency
      bottomNavigationBar: const AppNavigationBar(),

      appBar: AppBar(
        // Transparent AppBar with Dark Text
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Sign Dictionary',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
        ),
        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: GridView.builder(
          // Uses a fixed number of columns (4, based on your design)
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.85, // Adjust item height vs width
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
          itemCount: alphabetSigns.length,
          itemBuilder: (context, index) {
            final item = alphabetSigns[index];
            return DictionaryGridItem(
              letter: item.letter,
              imagePath: item.imagePath,
              onTap: () {
                // TODO: Implement navigation to a detailed sign page
                print('Tapped on sign for letter: ${item.letter}');
              },
            );
          },
        ),
      ),
    );
  }
}