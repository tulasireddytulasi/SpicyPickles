import 'package:flutter/material.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/banner_widget.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/popular_sellers_widget.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/search_bar_widget.dart';
import 'widgets/popular_categories_widget.dart';
import 'widgets/best_selling_pickles_widget.dart';
import 'widgets/popular_sellers_vertical_section_widget.dart' show PopularSellersVerticalSectionWidget;

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
            SearchBarWidget(),
            // Banner
            BannerWidget(),
            PopularCategoriesWidget(),
            PopularSellersWidget(),
            PopularSellersVerticalSectionWidget(),
            BestSellingPicklesWidget(),
            const SizedBox(height: 100),
            // Popular Categories
            // etc.
          ],
        ),
      ),
    );
  }
}