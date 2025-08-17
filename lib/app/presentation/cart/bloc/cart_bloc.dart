import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spicypickles/app/data/repositories/cart_repository.dart';
import 'package:spicypickles/app/data/models/model_exports.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartBloc({required this.cartRepository}) : super(const CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddItemToCart>(_onAddItemToCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<RemoveItemFromCart>(_onRemoveItemFromCart);
    on<ClearCart>(_onClearCart);

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

  // new changes

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await cartRepository.getCartItems();
      _calculateAndEmitCartState(emit, items);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onAddItemToCart(
      AddItemToCart event, Emitter<CartState> emit) async {
    try {
      final newItem = CartItemModel.fromProduct(event.product, quantity: event.quantity);
      await cartRepository.addItemToCart(newItem);
      final items = await cartRepository.getCartItems();
      _calculateAndEmitCartState(emit, items);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onUpdateCartItemQuantity(
      UpdateCartItemQuantity event, Emitter<CartState> emit) async {
    try {
      await cartRepository.updateCartItemQuantity(event.itemId, event.quantity);
      final items = await cartRepository.getCartItems();
      _calculateAndEmitCartState(emit, items);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onRemoveItemFromCart(
      RemoveItemFromCart event, Emitter<CartState> emit) async {
    try {
      await cartRepository.updateCartItemQuantity(event.itemId, 0); // Quantity 0 means remove
      final items = await cartRepository.getCartItems();
      _calculateAndEmitCartState(emit, items);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      await cartRepository.clearCart();
      _calculateAndEmitCartState(emit, []);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void _calculateAndEmitCartState(Emitter<CartState> emit, List<CartItemModel> items) {
    double subtotal = items.fold(0.0, (sum, item) => sum + item.totalPrice);
    double deliveryFee = items.isNotEmpty ? 2.99 : 0.0;
    double tax = subtotal * 0.08;
    double total = subtotal + deliveryFee + tax;

    emit(CartLoaded2(
      items: items,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      tax: tax,
      total: total,
    ));
  }
}
