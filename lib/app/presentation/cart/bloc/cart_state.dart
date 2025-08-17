part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
}

final class CartInitial extends CartState {
  const CartInitial();

  @override
  List<Object> get props => [];
}

final class CartLoaded extends CartState {
  final List<CartItemsModel> productList;
  final int totalQuantity;

  const CartLoaded({required this.productList, required this.totalQuantity});

  @override
  List<Object> get props => [productList, totalQuantity];
}

// new changes

// class CartInitial extends CartState {}

class CartLoading extends CartState {
  const CartLoading();

  @override
  List<Object> get props => [];
}

class CartLoaded2 extends CartState {
  final List<CartItemModel> items;
  final double subtotal;
  final double deliveryFee;
  final double tax;
  final double total;

  const CartLoaded2({
    this.items = const [],
    this.subtotal = 0.0,
    this.deliveryFee = 0.0,
    this.tax = 0.0,
    this.total = 0.0,
  });

  @override
  List<Object> get props => [items, subtotal, deliveryFee, tax, total];

  CartLoaded2 copyWith({
    List<CartItemModel>? items,
    double? subtotal,
    double? deliveryFee,
    double? tax,
    double? total,
  }) {
    return CartLoaded2(
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      tax: tax ?? this.tax,
      total: total ?? this.total,
    );
  }
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object> get props => [message];
}