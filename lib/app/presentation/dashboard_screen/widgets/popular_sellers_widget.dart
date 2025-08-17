// Purpose: Displays the "Popular Sellers" section with a horizontal list of seller cards.
// File: popular_sellers_widget.dart
// Folder: lib/widgets/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/mock_data/seller_mock_data.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/seller_card_widget.dart';

class PopularSellersWidget extends StatelessWidget {
  const PopularSellersWidget({super.key});

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
                'Popular Sellers',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tapped "See All" Sellers')),
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
        SizedBox(
          height: 180, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mockSellers.length,
            itemBuilder: (context, index) {
              return SellerCardWidget(seller: mockSellers[index]);
            },
          ),
        ),
      ],
    );
  }
}