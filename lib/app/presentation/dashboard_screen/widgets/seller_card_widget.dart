// Purpose: A widget for a single horizontally scrollable seller card.
// File: seller_card_widget.dart
// Folder: lib/widgets/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/models/seller_model.dart';

class SellerCardWidget extends StatelessWidget {
  final Seller seller;

  const SellerCardWidget({
    super.key,
    required this.seller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Stack(
              children: [
                Image.network(
                  seller.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      seller.deliveryTime,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      seller.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                   // const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: AppTheme.secondaryColor, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          seller.rating.toString(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: seller.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tag,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}