// Purpose: Displays the "Popular Sellers" section with a vertical list of seller cards.
// File: best_selling_pickles_widget.dart
// Folder: lib/widgets/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/mock_data/pickles_mock_data.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/pickle_card_widget.dart';

class BestSellingPicklesWidget extends StatelessWidget {
  const BestSellingPicklesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Selling Pickles',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tapped "See All" Pickles')),
                  );
                },
                child: const Text(
                  'See All',
                  style: TextStyle(color: AppTheme.primaryColor),
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemCount: mockPickles.length,
          itemBuilder: (context, index) {
            return PickleCardWidget(pickle: mockPickles[index]);
          },
        ),
      ],
    );
  }
}