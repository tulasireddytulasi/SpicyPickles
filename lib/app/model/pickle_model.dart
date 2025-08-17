// Purpose: A data model for a single pickle product.
// File: pickle.dart
// Folder: lib/models/

class Pickle {
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final String? tag;

  Pickle({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    this.tag,
  });
}