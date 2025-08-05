// // Purpose: Manages cart-related states and events.
// // File: cart_bloc.dart
// // Folder: lib/logic/blocs/cart/
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spicypickles/app/data/models/cart_item_model.dart';
// import 'package:spicypickles/app/data/repositories/cart_repository.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:spicypickles/app/data/models/product_model.dart';
//
//
// part 'cart_event.dart';
// part 'cart_state.dart';
//
// class CartBloc extends Bloc<CartEvent, CartState> {
//   final CartRepository cartRepository;
//
//   CartBloc({required this.cartRepository}) : super(CartInitial()) {
//     on<LoadCart>(_onLoadCart);
//     on<AddItemToCart>(_onAddItemToCart);
//     on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
//     on<RemoveItemFromCart>(_onRemoveItemFromCart);
//     on<ClearCart>(_onClearCart);
//   }
//
//   Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
//     emit(CartLoading());
//     try {
//       final items = await cartRepository.getCartItems();
//       _calculateAndEmitCartState(emit, items);
//     } catch (e) {
//       emit(CartError(e.toString()));
//     }
//   }
//
//   Future<void> _onAddItemToCart(
//       AddItemToCart event, Emitter<CartState> emit) async {
//     try {
//       final newItem = CartItemModel.fromProduct(event.product, quantity: event.quantity);
//       await cartRepository.addItemToCart(newItem);
//       final items = await cartRepository.getCartItems();
//       _calculateAndEmitCartState(emit, items);
//     } catch (e) {
//       emit(CartError(e.toString()));
//     }
//   }
//
//   Future<void> _onUpdateCartItemQuantity(
//       UpdateCartItemQuantity event, Emitter<CartState> emit) async {
//     try {
//       await cartRepository.updateCartItemQuantity(event.itemId, event.quantity);
//       final items = await cartRepository.getCartItems();
//       _calculateAndEmitCartState(emit, items);
//     } catch (e) {
//       emit(CartError(e.toString()));
//     }
//   }
//
//   Future<void> _onRemoveItemFromCart(
//       RemoveItemFromCart event, Emitter<CartState> emit) async {
//     try {
//       await cartRepository.updateCartItemQuantity(event.itemId, 0); // Quantity 0 means remove
//       final items = await cartRepository.getCartItems();
//       _calculateAndEmitCartState(emit, items);
//     } catch (e) {
//       emit(CartError(e.toString()));
//     }
//   }
//
//   Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
//     try {
//       await cartRepository.clearCart();
//       _calculateAndEmitCartState(emit, []);
//     } catch (e) {
//       emit(CartError(e.toString()));
//     }
//   }
//
//   void _calculateAndEmitCartState(Emitter<CartState> emit, List<CartItemModel> items) {
//     double subtotal = items.fold(0.0, (sum, item) => sum + item.totalPrice);
//     double deliveryFee = items.isNotEmpty ? 2.99 : 0.0;
//     double tax = subtotal * 0.08;
//     double total = subtotal + deliveryFee + tax;
//
//     emit(CartLoaded(
//       items: items,
//       subtotal: subtotal,
//       deliveryFee: deliveryFee,
//       tax: tax,
//       total: total,
//     ));
//   }
// }
