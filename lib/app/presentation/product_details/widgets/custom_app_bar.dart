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
      backgroundColor: Colors.transparent, // Transparent background as per HTML
      elevation: 0, // No shadow
      leadingWidth: 60, // Adjust leading width for the back button
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0), // Padding from the left edge
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(); // Navigate back
          },
          child: Container(
            width: 32, // w-8 in Tailwind
            height: 32, // h-8 in Tailwind
            decoration: BoxDecoration(
              color: AppTheme.blackColor.withOpacity(0.3), // bg-black/30
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new, // Equivalent to ri-arrow-left-line
              color: AppTheme.whiteColor,
              size: 20, // ri-lg is typically 24px, but 20 looks better in a 32x32 circle
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0), // Space between icons
          child: Container(
            width: 32, // w-8 in Tailwind
            height: 32, // h-8 in Tailwind
            decoration: BoxDecoration(
              color: AppTheme.blackColor.withOpacity(0.3), // bg-black/30
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border, // Equivalent to ri-heart-line
              color: AppTheme.whiteColor,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0), // Padding from the right edge
          child: Container(
            width: 32, // w-8 in Tailwind
            height: 32, // h-8 in Tailwind
            decoration: BoxDecoration(
              color: AppTheme.blackColor.withOpacity(0.3), // bg-black/30
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.share, // Equivalent to ri-share-line
              color: AppTheme.whiteColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}
