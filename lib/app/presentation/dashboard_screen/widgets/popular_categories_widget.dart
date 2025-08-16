// Purpose: Displays the "Popular Categories" section with a grid of clickable items.
// File: popular_categories_widget.dart
// Folder: lib/widgets/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/data/mock_data/category_mock_data.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/category_item_widget.dart';

class PopularCategoriesWidget extends StatelessWidget {
  const PopularCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Popular Categories',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemCount: mockCategories.length,
          itemBuilder: (context, index) {
            final category = mockCategories[index];
            return CategoryItemWidget(
              category: category,
              onTap: () {
                // Handle category tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${category.name}')),
                );
              },
            );
          },
        ),
      ],
    );
  }
}