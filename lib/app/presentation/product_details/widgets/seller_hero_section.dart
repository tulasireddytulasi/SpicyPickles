// Purpose: Displays the seller's main information (Featured/Pure Veg tags, Name, Tagline, Rating, Delivery Time, Distance).
// File: seller_hero_section.dart
// Folder: lib/presentation/widgets/seller_details/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/models/seller_details_model.dart' show SellerDetailsModel;

class FeaturedWidget extends StatelessWidget {
  final SellerDetailsModel sellerDetails;

  const FeaturedWidget({super.key, required this.sellerDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 16, top: 90.0),
      child: Row(
        children: [
          if (sellerDetails.features.isNotEmpty)
            ...sellerDetails.features.map((feature) => Padding(
                  padding: const EdgeInsets.only(right: 8.0), // gap-2
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0), // px-2 py-0.5
                    decoration: BoxDecoration(
                      color: feature == 'Featured'
                          ? AppTheme.primaryColor // bg-primary
                          : AppTheme.gray100, // bg-gray-100
                      borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                    ),
                    child: Text(
                      feature,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10, // text-xs
                            color: feature == 'Featured'
                                ? AppTheme.whiteColor // text-white
                                : AppTheme.gray600, // text-gray-600
                          ),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}

class OverallRatingWidget extends StatelessWidget {
  final SellerDetailsModel sellerDetails;

  const OverallRatingWidget({super.key, required this.sellerDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 16, top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sellerDetails.tagline,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14, // text-sm
                  color: AppTheme.gray500, // text-gray-500
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              // Rating
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // px-2 py-1
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor, // bg-primary
                  borderRadius: Theme.of(context).customBorderRadius.defaultRadius, // rounded
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star_rounded, // ri-star-fill
                      color: AppTheme.whiteColor,
                      size: 16, // mr-1 (icon size)
                    ),
                    const SizedBox(width: 4),
                    Text(
                      sellerDetails.overallRating.toStringAsFixed(1), // 4.8
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14, // text-sm
                            fontWeight: FontWeight.w500, // font-medium
                            color: AppTheme.whiteColor,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16), // gap-4
              // Delivery Time
              Row(
                children: [
                  const Icon(
                    Icons.access_time, // ri-time-line
                    color: AppTheme.gray600,
                    size: 16, // mr-1 (icon size)
                  ),
                  const SizedBox(width: 4),
                  Text(
                    sellerDetails.deliveryTime, // 30-40 min
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14, // text-sm
                          color: AppTheme.gray600, // text-gray-600
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 16), // gap-4
              // Distance
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined, // ri-map-pin-line
                    color: AppTheme.gray600,
                    size: 16, // mr-1 (icon size)
                  ),
                  const SizedBox(width: 4),
                  Text(
                    sellerDetails.distance, // 2.4 miles
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14, // text-sm
                          color: AppTheme.gray600, // text-gray-600
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SellerHeroSection extends StatelessWidget {
  final SellerDetailsModel sellerDetails;

  const SellerHeroSection({super.key, required this.sellerDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // px-4 py-3
      color: AppTheme.whiteColor, // bg-white
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Featured / Pure Veg tags
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0), // mb-2
            child: Row(
              children: [
                if (sellerDetails.features.isNotEmpty)
                  ...sellerDetails.features.map((feature) => Padding(
                        padding: const EdgeInsets.only(right: 8.0), // gap-2
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0), // px-2 py-0.5
                          decoration: BoxDecoration(
                            color: feature == 'Featured'
                                ? AppTheme.primaryColor // bg-primary
                                : AppTheme.gray100, // bg-gray-100
                            borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                          ),
                          child: Text(
                            feature,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 10, // text-xs
                                  color: feature == 'Featured'
                                      ? AppTheme.whiteColor // text-white
                                      : AppTheme.gray600, // text-gray-600
                                ),
                          ),
                        ),
                      )),
              ],
            ),
          ),
          // Seller Name
          Text(
            sellerDetails.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24, // text-2xl
                  fontWeight: FontWeight.bold, // font-bold
                  color: AppTheme.gray800, // text-gray-800
                ),
          ),
          const SizedBox(height: 4), // mb-2 (approx)
          // Tagline
          Text(
            sellerDetails.tagline,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14, // text-sm
                  color: AppTheme.gray500, // text-gray-500
                ),
          ),
          const SizedBox(height: 8), // mb-2 (approx)
          // Rating, Delivery Time, Distance
        ],
      ),
    );
  }
}
