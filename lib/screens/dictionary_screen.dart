import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

// Placeholder for the Sign Dictionary Screen (based on image_aef797.png)
class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Sign Dictionary', style: TextStyle(color: AppColors.darkPrimary, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.darkPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        itemCount: 26, // A-Z
        itemBuilder: (context, index) {
          String letter = String.fromCharCode('A'.codeUnitAt(0) + index);
          return Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.surface.withOpacity(0.4),
                child: Text(
                  letter,
                  style: TextStyle(
                    color: AppColors.darkPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
          );
        },
      ),
    );
  }
}
