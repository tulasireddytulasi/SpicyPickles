// Purpose: Data model for a product/menu item.
// File: product_model.dart
// Folder: lib/data/models/

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double? originalPrice;
  final double rating;
  final int reviewsCount;
  final List<String> tags;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.reviewsCount,
    this.tags = const [],
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    imageUrl,
    price,
    originalPrice,
    rating,
    reviewsCount,
    tags,
  ];

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
    double? originalPrice,
    double? rating,
    int? reviewsCount,
    List<String>? tags,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      tags: tags ?? this.tags,
    );
  }
}
