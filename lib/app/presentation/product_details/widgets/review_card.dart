// Purpose: Represents a single customer review with reviewer's image, name, rating, date, comment, and optional review photos.
// File: review_card.dart
// Folder: lib/presentation/widgets/reviews/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  final bool isLastItem; // To control the bottom border

  const ReviewCard({super.key, required this.review, this.isLastItem = false});

  // Helper to build star rating icons for individual reviews
  Widget _buildStarRating(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(const Icon(Icons.star, color: AppTheme.secondaryColor, size: 14)); // text-xs
      } else if (i - rating < 1 && i - rating > 0) {
        stars.add(const Icon(Icons.star_half, color: AppTheme.secondaryColor, size: 14)); // text-xs
      } else {
        stars.add(const Icon(Icons.star_border, color: AppTheme.secondaryColor, size: 14)); // text-xs
      }
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isLastItem
            ? null
            : const Border(bottom: BorderSide(color: AppTheme.gray100, width: 1.0)), // border-b border-gray-100
      ),
      padding: const EdgeInsets.only(bottom: 12.0), // pb-3
      margin: isLastItem ? EdgeInsets.zero : const EdgeInsets.only(bottom: 12.0), // mb-3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reviewer Image
                  Container(
                    width: 32, // w-8
                    height: 32, // h-8
                    margin: const EdgeInsets.only(right: 8.0), // mr-2
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        review.reviewerImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppTheme.gray100,
                          child: const Icon(Icons.person, color: AppTheme.gray500, size: 20),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reviewer Name
                      Text(
                        review.reviewerName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14, // text-sm
                          fontWeight: FontWeight.w500, // font-medium
                          color: AppTheme.gray800, // text-gray-800
                        ),
                      ),
                      const SizedBox(height: 2), // mt-0.5 (approx)
                      // Review Rating
                      _buildStarRating(review.rating),
                    ],
                  ),
                ],
              ),
              // Review Date
              Text(
                review.date,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12, // text-xs
                  color: AppTheme.gray500, // text-gray-500
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // mt-2 (approx)
          // Review Comment
          Text(
            review.comment,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12, // text-xs
              color: AppTheme.gray600, // text-gray-600
            ),
          ),
          // Review Photos (if any)
          if (review.imageUrls.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0), // mt-2
              child: Wrap(
                spacing: 8.0, // space-x-2
                runSpacing: 8.0,
                children: review.imageUrls.map((imageUrl) {
                  return Container(
                    width: 64, // w-16
                    height: 64, // h-16
                    decoration: BoxDecoration(
                      borderRadius: Theme.of(context).customBorderRadius.defaultRadius, // rounded-md
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppTheme.gray100,
                        child: const Icon(Icons.image, color: AppTheme.gray500),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
