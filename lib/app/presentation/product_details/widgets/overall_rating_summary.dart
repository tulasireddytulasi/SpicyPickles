// Purpose: Shows the overall rating (e.g., 4.8 stars, total reviews) and the rating distribution bar chart.
// File: overall_rating_summary.dart
// Folder: lib/presentation/widgets/reviews/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/models/seller_details_model.dart';

class OverallRatingSummary extends StatefulWidget {
  final SellerDetailsModel sellerDetails;

  const OverallRatingSummary({super.key, required this.sellerDetails});

  @override
  State<OverallRatingSummary> createState() => _OverallRatingSummaryState();
}

class _OverallRatingSummaryState extends State<OverallRatingSummary> {
  // Helper to build star rating icons for overall rating
  Widget _buildOverallStarRating(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(const Icon(Icons.star_rounded, color: AppTheme.secondaryColor, size: 20)); // text-secondary
      } else if (i - rating < 1 && i - rating > 0) {
        stars.add(const Icon(Icons.star_half_rounded, color: AppTheme.secondaryColor, size: 20));
      } else {
        stars.add(const Icon(Icons.star_border_rounded, color: AppTheme.secondaryColor, size: 20));
      }
    }
    return Row(children: stars);
  }

  // Helper to build a single rating progress bar
  Widget _buildRatingProgressBar(int star, double percentage) {
    return Row(
      children: [
        SizedBox(
          width: 32, // w-8
          child: Text(
            '$star ★',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12, // text-xs
              color: AppTheme.gray600, // text-gray-600
            ),
          ),
        ),
        const SizedBox(width: 8), // mx-2 (half of 16px)
        Expanded(
          child: Container(
            height: 8, // h-8
            decoration: BoxDecoration(
              color: AppTheme.gray100, // review-progress-bar bg-gray-100
              borderRadius: Theme.of(context).customBorderRadius.sm, // rounded-sm
            ),
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: percentage / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor, // review-progress-fill bg-secondary
                  borderRadius: Theme.of(context).customBorderRadius.sm,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8), // mx-2 (half of 16px)
        Text(
          '${percentage.toInt()}%',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12, // text-xs
            color: AppTheme.gray600, // text-gray-600
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // p-4
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 1, // shadow-sm
        shape: RoundedRectangleBorder(
          borderRadius: Theme.of(context).customBorderRadius.lg, // rounded-lg
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0), // p-4
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Overall Rating Score and Stars
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0), // mr-3
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.sellerDetails.overallRating.toStringAsFixed(1), // 4.8
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 24, // text-2xl
                            fontWeight: FontWeight.bold, // font-bold
                            color: AppTheme.gray800, // text-gray-800
                          ),
                        ),
                        _buildOverallStarRating(widget.sellerDetails.overallRating),
                        const SizedBox(height: 4), // mt-1
                        Text(
                          '${widget.sellerDetails.totalReviews}+ reviews',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12, // text-xs
                            color: AppTheme.gray500, // text-gray-500
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        // Rating Distribution Bars (mock data for now)
                        _buildRatingProgressBar(5, 80), // 80%
                        const SizedBox(height: 6), // space-y-1.5
                        _buildRatingProgressBar(4, 15), // 15%
                        const SizedBox(height: 6),
                        _buildRatingProgressBar(3, 3), // 3%
                        const SizedBox(height: 6),
                        _buildRatingProgressBar(2, 1), // 1%
                        const SizedBox(height: 6),
                        _buildRatingProgressBar(1, 1), // 1%
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
