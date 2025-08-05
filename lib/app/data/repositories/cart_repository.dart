// Purpose: Provides a mock API for managing cart data.
// File: cart_repository.dart
// Folder: lib/data/repositories/


import 'package:spicypickles/app/data/models/cart_item_model.dart' show CartItemModel;

class CartRepository {
  List<CartItemModel> _cartItems = [];

  Future<List<CartItemModel>> getCartItems() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_cartItems); // Return a copy to prevent external modification
  }

  Future<void> addItemToCart(CartItemModel item) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    final existingIndex = _cartItems.indexWhere((element) => element.id == item.id);
    if (existingIndex != -1) {
      _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
        quantity: _cartItems[existingIndex].quantity + item.quantity,
      );
    } else {
      _cartItems.add(item);
    }
  }

  Future<void> updateCartItemQuantity(String itemId, int quantity) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    final index = _cartItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      if (quantity > 0) {
        _cartItems[index] = _cartItems[index].copyWith(quantity: quantity);
      } else {
        _cartItems.removeAt(index);
      }
    }
  }

  Future<void> clearCart() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    _cartItems = [];
  }
}
