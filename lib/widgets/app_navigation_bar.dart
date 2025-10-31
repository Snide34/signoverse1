import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

/// A custom, aesthetically pleasing bottom navigation bar for the application.
class AppNavigationBar extends StatelessWidget {
  /// The currently selected index (0-4).
  final int currentIndex;

  /// Callback function when a navigation item is tapped.
  final ValueChanged<int> onItemSelected;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  // Define the navigation items
  final List<Map<String, dynamic>> navItems = const [
    {'icon': Icons.home_rounded, 'label': 'Home', 'index': 0},
    {'icon': Icons.connect_without_contact_rounded, 'label': 'Translate', 'index': 1},
    {'icon': Icons.menu_book_rounded, 'label': 'Dictionary', 'index': 2},
    {'icon': Icons.school_rounded, 'label': 'Learn', 'index': 3},
    {'icon': Icons.person_rounded, 'label': 'Profile', 'index': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // FIX: Replaced AppColors.surface with AppColors.background to resolve "getter 'surface' isn't defined" error.
      decoration: BoxDecoration(
        color: AppColors.background, // Using background as a common defined color
        boxShadow: [
          BoxShadow(
            // Subtle shadow for lift effect
            color: AppColors.darkText.withAlpha(0x33),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), // Increased rounding
          topRight: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onItemSelected, // This links the UI tap event to the required callback
          type: BottomNavigationBarType.fixed, // ensures items are evenly spaced
          backgroundColor: AppColors.primary,

          // Styling for selected items (Uses AppColors.action - Orange)
          selectedItemColor: AppColors.action,
          selectedIconTheme: const IconThemeData(size: 28),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),

          // Styling for unselected items (Uses a muted white/lightText)
          unselectedItemColor: AppColors.lightText.withAlpha(0xAA), // Less visible than selected
          unselectedIconTheme: const IconThemeData(size: 24),
          unselectedLabelStyle: const TextStyle(fontSize: 11),

          elevation: 0, // Elevation is handled by the container's shadow

          items: navItems.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item['icon']),
              label: item['label'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
