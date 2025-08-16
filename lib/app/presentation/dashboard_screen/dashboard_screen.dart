import 'package:flutter/material.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/banner_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Placeholder for other sections
            // Search Bar
            // Banner
            BannerWidget(),
            // Popular Categories
            // etc.
          ],
        ),
      ),
    );
  }
}