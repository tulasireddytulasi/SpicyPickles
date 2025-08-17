import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/lottie/empty_cart_animation.json', // Path to your Lottie JSON file
              width: 200, // Adjust size as needed
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32.0), // Spacing below the animation
            // Bold Headline
            Text(
              'Your cart is empty!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800], // Darker grey for headline
              ),
            ),
            const SizedBox(height: 12.0), // Spacing below headline

            // Smaller Subtext
            Text(
              'Looks like you haven’t added anything to your cart yet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600], // Medium grey for subtext
              ),
            ),
            const SizedBox(height: 48.0), // Spacing before the button

            // Primary Button
            SizedBox(
              width: double.infinity, // Button takes full available width
              height: 56.0, // Fixed height for the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor, // Accent color for the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  ),
                  elevation: 5, // Shadow for the button
                  shadowColor: AppTheme.primaryColor.withValues(alpha: 0.4), // Softer shadow
                ),
                child: const Text(
                  'Start Shopping',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // White text for the button
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
