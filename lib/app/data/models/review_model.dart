// Purpose: Data model for a customer review.
// File: review_model.dart
// Folder: lib/data/models/

import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String id;
  final String reviewerName;
  final String reviewerImageUrl;
  final double rating;
  final String date;
  final String comment;
  final List<String> imageUrls;

  const ReviewModel({
    required this.id,
    required this.reviewerName,
    required this.reviewerImageUrl,
    required this.rating,
    required this.date,
    required this.comment,
    this.imageUrls = const [],
  });

  @override
  List<Object?> get props => [
    id,
    reviewerName,
    reviewerImageUrl,
    rating,
    date,
    comment,
    imageUrls,
  ];

  ReviewModel copyWith({
    String? id,
    String? reviewerName,
    String? reviewerImageUrl,
    double? rating,
    String? date,
    String? comment,
    List<String>? imageUrls,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerImageUrl: reviewerImageUrl ?? this.reviewerImageUrl,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      comment: comment ?? this.comment,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}
