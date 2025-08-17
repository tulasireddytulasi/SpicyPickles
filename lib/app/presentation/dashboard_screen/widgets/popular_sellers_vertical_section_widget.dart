// Purpose: Displays the "Popular Sellers" section with a vertical list of detailed seller cards.
// File: popular_sellers_vertical_section_widget.dart
// Folder: lib/widgets/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/mock_data/seller_mock_data.dart';
import 'seller_vertical_card_widget.dart';

class PopularSellersVerticalSectionWidget extends StatelessWidget {
  const PopularSellersVerticalSectionWidget({super.key});

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
                'Popular Sellers', // Section title
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tapped "See All" Vertical Sellers')),
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
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(), // Important for nested scrolling
          shrinkWrap: true, // Important for nested scrolling
          itemCount: mockSellers.length,
          itemBuilder: (context, index) {
            final seller = mockSellers[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0), // Adds spacing between cards
              child: SellerVerticalCardWidget(seller: seller),
            );
          },
        ),
      ],
    );
  }
}