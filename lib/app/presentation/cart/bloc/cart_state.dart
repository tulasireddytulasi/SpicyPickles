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

  const CartLoaded({required this.productList});

  @override
  List<Object> get props => [productList];
}
