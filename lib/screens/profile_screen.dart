import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'edit_info_screen.dart'; // We'll need this screen for navigation

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold background set to the light background color
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        // Transparent AppBar to blend with the background
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Profile', style: TextStyle(color: AppColors.darkPrimary, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Profile Header Section ---
            _buildProfileHeader(context),
            const SizedBox(height: 20),

            // --- Navigation List Items ---
            _buildProfileItem(
              context,
              Icons.person_outline,
              'Edit Info',
              // Navigate to EditInfoScreen (which we will define next)
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EditInfoScreen()),
                );
              },
            ),
            _buildProfileItem(context, Icons.favorite_border, 'Favorite', onTap: () {}),
            _buildProfileItem(context, Icons.settings_outlined, 'Settings', onTap: () {}),
            _buildProfileItem(context, Icons.help_outline, 'Help', onTap: () {}),

            // --- Logout Button ---
            _buildProfileItem(context, Icons.logout, 'Logout', isLogout: true, onTap: () {
              // Placeholder for actual logout logic
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logging out...')),
              );
            }),
            const SizedBox(height: 50), // Final spacing
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          // User Avatar and Edit Icon Stack
          Stack(
            children: [
              // Using a placeholder image for the avatar
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://placehold.co/100x100/799A83/1B2426?text=Mahi'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.accent, // Orange accent for the edit badge
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, size: 16, color: AppColors.darkText),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          // User Details Column
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Mahi Kandari',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkText)
              ),
              SizedBox(height: 4),
              Text(
                  '+91 96709 89000',
                  style: TextStyle(fontSize: 14, color: AppColors.darkText)
              ),
              Text(
                  'mahikandari2005@gmail.com',
                  style: TextStyle(fontSize: 14, color: AppColors.darkText)
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String title, {bool isLogout = false, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkPrimary, // Dark green background for the list item
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimary.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.background), // Light icon color
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.background, // Light text color
            fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: isLogout
            ? null
            : Icon(Icons.arrow_forward_ios, color: AppColors.background, size: 18),
        onTap: onTap,
      ),
    );
  }
}
