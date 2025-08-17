// Purpose: A data model for a single seller.
// File: seller.dart
// Folder: lib/models/

class Seller {
  final String name;
  final String imageUrl;
  final double rating;
  final String deliveryTime;
  final List<String> tags;

  Seller({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
    required this.tags,
  });
}