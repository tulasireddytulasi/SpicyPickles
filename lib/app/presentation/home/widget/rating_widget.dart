import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating; // Current rating (0-5)
  final int maxRating; // Maximum stars (default 5)
  final Color filledColor; // Color for filled stars
  final Color unfilledColor; // Color for unfilled stars
  final double starSize; // Size of each star

  const StarRating({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
    this.starSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? filledColor : unfilledColor,
          size: starSize,
        );
      }),
    );
  }
}