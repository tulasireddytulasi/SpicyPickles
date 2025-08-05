// Purpose: Data model for an item in the cart.
// File: cart_item_model.dart
// Folder: lib/data/models/

import 'package:equatable/equatable.dart';
import 'package:spicypickles/app/data/models/product_model.dart' show ProductModel;

class CartItemModel extends Equatable {
  final String id; // Product ID
  final String name;
  final double price;
  int quantity;
  final String imageUrl; // Added for cart display

  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  // Factory constructor to create a CartItemModel from a ProductModel
  factory CartItemModel.fromProduct(ProductModel product, {int quantity = 1}) {
    return CartItemModel(
      id: product.id,
      name: product.name,
      price: product.price,
      quantity: quantity,
      imageUrl: product.imageUrl,
    );
  }

  // Method to get the total price for this item (price * quantity)
  double get totalPrice => price * quantity;

  @override
  List<Object?> get props => [id, name, price, quantity, imageUrl];

  CartItemModel copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    String? imageUrl,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
