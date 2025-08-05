// // Purpose: Defines events for the Cart Bloc.
// // File: cart_event.dart
// // Folder: lib/logic/blocs/cart/
//
// // import 'package:equatable/equatable.dart';
// // import 'package:grandmas_pickles/data/models/cart_item_model.dart';
// // import 'package:grandmas_pickles/data/models/product_model.dart';
//
// part of 'cart_bloc.dart';
//
// abstract class CartEvent extends Equatable {
//   const CartEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoadCart extends CartEvent {
//   const LoadCart();
// }
//
// class AddItemToCart extends CartEvent {
//   final ProductModel product;
//   final int quantity;
//
//   const AddItemToCart(this.product, {this.quantity = 1});
//
//   @override
//   List<Object> get props => [product, quantity];
// }
//
// class UpdateCartItemQuantity extends CartEvent {
//   final String itemId;
//   final int quantity;
//
//   const UpdateCartItemQuantity(this.itemId, this.quantity);
//
//   @override
//   List<Object> get props => [itemId, quantity];
// }
//
// class RemoveItemFromCart extends CartEvent {
//   final String itemId;
//
//   const RemoveItemFromCart(this.itemId);
//
//   @override
//   List<Object> get props => [itemId];
// }
//
// class ClearCart extends CartEvent {
//   const ClearCart();
// }
