// // Purpose: Defines states for the Cart Bloc.
// // File: cart_state.dart
// // Folder: lib/logic/blocs/cart/
//
// // import 'package:equatable/equatable.dart';
// // import 'package:grandmas_pickles/data/models/cart_item_model.dart';
// part of 'cart_bloc.dart';
//
// abstract class CartState extends Equatable {
//   const CartState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class CartInitial extends CartState {}
//
// class CartLoading extends CartState {}
//
// class CartLoaded extends CartState {
//   final List<CartItemModel> items;
//   final double subtotal;
//   final double deliveryFee;
//   final double tax;
//   final double total;
//
//   const CartLoaded({
//     this.items = const [],
//     this.subtotal = 0.0,
//     this.deliveryFee = 0.0,
//     this.tax = 0.0,
//     this.total = 0.0,
//   });
//
//   @override
//   List<Object> get props => [items, subtotal, deliveryFee, tax, total];
//
//   CartLoaded copyWith({
//     List<CartItemModel>? items,
//     double? subtotal,
//     double? deliveryFee,
//     double? tax,
//     double? total,
//   }) {
//     return CartLoaded(
//       items: items ?? this.items,
//       subtotal: subtotal ?? this.subtotal,
//       deliveryFee: deliveryFee ?? this.deliveryFee,
//       tax: tax ?? this.tax,
//       total: total ?? this.total,
//     );
//   }
// }
//
// class CartError extends CartState {
//   final String message;
//
//   const CartError(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
