// Purpose: A horizontal scrollable list of category buttons.
// File: category_navigation_bar.dart
// Folder: lib/presentation/widgets/menu/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grandmas_pickles/logic/blocs/product/product_bloc.dart';
// import 'package:grandmas_pickles/logic/blocs/product/product_event.dart';
// import 'package:grandmas_pickles/logic/blocs/product/product_state.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/presentation/product_details/bloc/product_bloc.dart';

class CategoryNavigationBar extends StatelessWidget {
  const CategoryNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        String activeCategory = 'all'; // Default active category

        if (state is ProductLoaded) {
          activeCategory = state.activeCategory;
        }

        // Define the categories. These could also come from a data source.
        final List<Map<String, String>> categories = [
          {'name': 'All Items', 'key': 'all'},
          {'name': 'Bestsellers', 'key': 'bestsellers'},
          {'name': 'Mango Pickles', 'key': 'mango'},
          {'name': 'Mixed Pickles', 'key': 'mixed'},
          {'name': 'Spicy Pickles', 'key': 'spicy'},
          {'name': 'Sweet Pickles', 'key': 'sweet'},
        ];

        return Container(
          color: AppTheme.whiteColor, // bg-white
          // Sticky top-0 and border-b are handled by its placement in SellerDetailsScreen
          padding: const EdgeInsets.symmetric(vertical: 12.0), // py-3 (approx)
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // px-4
            child: Row(
              children: categories.map((category) {
                final bool isActive = activeCategory == category['key'];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0), // space-x-2
                  child: ElevatedButton(
                    onPressed: () {
                      // Dispatch event to change active category and potentially load new products
                      context.read<ProductBloc>().add(LoadProductsByCategory(category['key']!));
                      // In a real app, you might also trigger a scroll to the relevant section
                      // or filter the displayed products here.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isActive
                          ? AppTheme.primaryColor // active: bg-primary
                          : AppTheme.gray100, // bg-gray-100
                      foregroundColor: isActive
                          ? AppTheme.whiteColor // active: text-white
                          : AppTheme.gray600, // text-gray-600
                      shape: RoundedRectangleBorder(
                        borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0), // px-4 py-1.5
                      elevation: 0, // No shadow for category pills
                      minimumSize: Size.zero, // Remove default minimum size
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink tap area
                    ),
                    child: Text(
                      category['name']!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14, // text-sm
                        fontWeight: FontWeight.w500, // font-medium
                        color: isActive ? Colors.white: AppTheme.gray600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
