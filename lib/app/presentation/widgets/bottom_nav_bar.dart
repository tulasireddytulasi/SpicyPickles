// Purpose: The persistent bottom navigation bar (Home, Explore, Cart, Orders, Account).
// File: bottom_nav_bar.dart
// Folder: lib/presentation/widgets/common/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart'; // Import AppTheme for colors

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1; // 'Explore' is the active tab in the HTML, so index 1

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // In a real application, you would navigate to different screens here
    // based on the selected index. For now, we just update the state.
    // Example:
    // switch (index) {
    //   case 0:
    //     Navigator.pushReplacementNamed(context, '/home');
    //     break;
    //   case 1:
    //     Navigator.pushReplacementNamed(context, '/explore');
    //     break;
    //   // ... other cases
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2), // Shadow at the top
          ),
        ],
      ),
      height: 64, // h-16 in Tailwind (16 * 4 = 64px)
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        backgroundColor: AppTheme.whiteColor, // Match container background
        selectedItemColor: AppTheme.primaryColor, // text-primary
        unselectedItemColor: AppTheme.gray500, // text-gray-500
        selectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 10, // text-[10px]
          fontWeight: FontWeight.w500, // Slightly bolder for selected
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 10, // text-[10px]
        ),
        showUnselectedLabels: true, // Always show labels
        elevation: 0, // No default elevation, handled by container shadow
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24), // ri-home-5-line
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, size: 24), // ri-compass-3-line
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 24), // ri-shopping-cart-2-line
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt, size: 24), // ri-file-list-3-line
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24), // ri-user-3-line
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
