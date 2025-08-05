// Purpose: Provides a mock API for fetching product data.
// File: product_repository.dart
// Folder: lib/data/repositories/

import 'package:spicypickles/app/data/models/product_model.dart' show ProductModel;

class ProductRepository {
  Future<List<ProductModel>> fetchBestsellers() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProductModel(
        id: '1',
        name: 'Mango Pickle',
        description: 'Traditional mango pickle with special spice blend',
        imageUrl: 'https://readdy.ai/api/search-image?query=Gourmet%2520mango%2520pickle%2520in%2520clear%2520glass%2520jar%252C%2520vibrant%2520yellow%2520color%252C%2520professional%2520food%2520photography%252C%2520white%2520background&width=200&height=200&seq=201&orientation=squarish',
        price: 6.99,
        originalPrice: 8.99,
        rating: 4.8,
        reviewsCount: 120,
        tags: [],
      ),
      ProductModel(
        id: '2',
        name: 'Mixed Pickle',
        description: 'Assorted vegetables in aromatic spices',
        imageUrl: 'https://readdy.ai/api/search-image?query=Mixed%2520vegetable%2520pickle%2520in%2520clear%2520glass%2520jar%252C%2520colorful%2520vegetables%252C%2520professional%2520food%2520photography%252C%2520white%2520background&width=200&height=200&seq=202&orientation=squarish',
        price: 5.99,
        originalPrice: 7.99,
        rating: 4.2,
        reviewsCount: 85,
        tags: ['Spicy'],
      ),
      ProductModel(
        id: '3',
        name: 'Garlic Pickle',
        description: 'Spicy garlic pickle with aromatic herbs',
        imageUrl: 'https://readdy.ai/api/search-image?query=Spicy%2520garlic%2520pickle%2520in%2520glass%2520jar%252C%2520red%2520chili%2520flakes%2520visible%252C%2520artistic%2520food%2520photography%252C%2520clean%2520background%252C%2520professional%2520product%2520shot&width=200&height=200&seq=203&orientation=squarish',
        price: 7.49,
        originalPrice: 9.49,
        rating: 5.0,
        reviewsCount: 32,
        tags: ['New'],
      ),
      ProductModel(
        id: '4',
        name: 'Lemon Pickle',
        description: 'Tangy lemon pickle with mild spices',
        imageUrl: 'https://readdy.ai/api/search-image?query=Sweet%2520lemon%2520pickle%2520in%2520glass%2520jar%252C%2520bright%2520yellow%2520color%252C%2520artistic%2520food%2520photography%252C%2520clean%2520background%252C%2520professional%2520product%2520shot&width=200&height=200&seq=204&orientation=squarish',
        price: 6.49,
        originalPrice: 8.49,
        rating: 4.7,
        reviewsCount: 95,
        tags: [],
      ),
    ];
  }

  Future<List<ProductModel>> fetchSpecialOffers() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProductModel(
        id: '5',
        name: 'Pickle Gift Box',
        description: 'Assortment of 4 premium pickles',
        imageUrl: 'https://readdy.ai/api/search-image?query=Pickle%2520gift%2520box%2520with%2520assorted%2520pickle%2520jars%252C%2520elegant%2520packaging%252C%2520artistic%2520food%2520photography%252C%2520clean%2520background%252C%2520professional%2520product%2520shot&width=200&height=200&seq=205&orientation=squarish',
        price: 24.99,
        originalPrice: 32.99,
        rating: 0.0, // Not applicable for gift box in HTML
        reviewsCount: 0,
        tags: ['25% OFF'],
      ),
    ];
  }

  Future<List<ProductModel>> fetchProductsByCategory(String category) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // This is a simplified mock. In a real app, you'd filter based on category.
    // For now, it returns all bestsellers.
    return fetchBestsellers();
  }
}
