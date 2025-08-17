// Purpose: A data model for a single seller, updated to include review count.
// File: seller.dart
// Folder: lib/models/

class Seller {
  final String name;
  final String imageUrl;
  final double rating;
  final int reviewCount; // Added reviewCount
  final String deliveryTime;
  final List<String> tags;

  Seller({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount, // Added reviewCount
    required this.deliveryTime,
    required this.tags,
  });
}