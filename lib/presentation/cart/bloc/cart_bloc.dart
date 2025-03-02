import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spicypickles/model/cart_items_model.dart';
import 'package:spicypickles/model/products_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<AddItem>(_addItem);
    on<RemoveItem>(_removeItem);
    on<clearAllItem>(_clearAllItems);
  }

  final List<CartItemsModel> cart = [];

  FutureOr<void> _addItem(AddItem event, Emitter<CartState> emit) {
    // Find the index of the product in the cart
    int index = cart.indexWhere((item) => item.product?.title == event.product.title);

    if (index != -1) {
      // Product already exists, increase quantity
      // Don't update cart list values directly, instead assign new instance
      cart[index] = CartItemsModel(
        product: cart[index].product,
        quantity: (cart[index].quantity ?? 0) + 1,
      );
    } else {
      // Product not found, add new item
      cart.add(CartItemsModel(product: event.product, quantity: 1));
    }
    emit(CartLoaded(productList: [...cart]));
  }

  FutureOr<void> _removeItem(RemoveItem event, Emitter<CartState> emit) {
    // Find the index of the product in the cart
    int index = cart.indexWhere((item) => item.product?.title == event.product.title);

    if (index != -1) {
      if (cart[index].quantity! > 1) {
        // Reduce quantity if more than 1
        //cart[index].quantity = cart[index].quantity! - 1;
        cart[index] = CartItemsModel(
          product: cart[index].product,
          quantity: (cart[index].quantity ?? 0) - 1,
        );
      } else {
        // Remove product if quantity is 1
        cart.removeAt(index);
      }
    }

    emit(CartLoaded(productList: [...cart]));
  }

  FutureOr<void> _clearAllItems(clearAllItem event, Emitter<CartState> emit) {
    cart.clear();
    emit(CartLoaded(productList: [...cart]));
  }
}
