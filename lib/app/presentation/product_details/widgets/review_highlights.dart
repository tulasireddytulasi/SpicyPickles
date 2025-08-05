// Purpose: Displays popular review tags (e.g., "Authentic taste", "Great quality").
// File: review_highlights.dart
// Folder: lib/presentation/widgets/reviews/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';

class ReviewHighlights extends StatelessWidget {
  final List<String> highlights;

  const ReviewHighlights({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    if (highlights.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // mb-4 (approx)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What people are saying',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14, // text-sm
              fontWeight: FontWeight.w500, // font-medium
              color: AppTheme.gray800, // text-gray-700
            ),
          ),
          const SizedBox(height: 8), // mb-2
          Wrap(
            spacing: 8.0, // gap-2
            runSpacing: 8.0,
            children: highlights.map((highlight) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0), // px-2.5 py-1
                decoration: BoxDecoration(
                  color: AppTheme.background, // bg-background
                  borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                ),
                child: Text(
                  highlight,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12, // text-xs
                    color: AppTheme.primaryColor, // text-primary
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
