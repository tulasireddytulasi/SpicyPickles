// Purpose: A custom app bar for the top navigation (back, favorite, share icons).
// File: custom_app_bar.dart
// Folder: lib/presentation/widgets/common/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart'; // Import AppTheme for colors

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Transparent background as per HTML
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.white,
      elevation: 2, // No shadow
      shadowColor: AppTheme.blackColor.withValues(alpha: 0.3),
      leadingWidth: 60, // Adjust leading width for the back button
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0), // Padding from the left edge
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(); // Navigate back
          },
          child: const Icon(
            Icons.arrow_back_ios_new, // Equivalent to ri-arrow-left-line
            color: AppTheme.blackColor,
            size: 24, // ri-lg is typically 24px, but 20 looks better in a 32x32 circle
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0), // Space between icons
          child: const Icon(
            Icons.favorite_border, // Equivalent to ri-heart-line
            color: AppTheme.blackColor,
            size: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0), // Padding from the right edge
          child: const Icon(
            Icons.share, // Equivalent to ri-share-line
            color: AppTheme.blackColor,
            size: 24,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}
