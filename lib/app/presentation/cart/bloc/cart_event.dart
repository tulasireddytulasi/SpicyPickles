part of 'cart_bloc.dart';

@immutable
sealed class CartEvent extends Equatable {
  const CartEvent();
}

final class AddItem extends CartEvent {
  const AddItem({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

final class RemoveItem extends CartEvent {
  const RemoveItem({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

final class clearAllItem extends CartEvent {
  const clearAllItem();

  @override
  List<Object?> get props => [];
}

// new changes

final class LoadCart extends CartEvent {
  const LoadCart();

  @override
  List<Object?> get props => [];
}

final class AddItemToCart extends CartEvent {
  final ProductModel product;
  final int quantity;

  const AddItemToCart(this.product, {this.quantity = 1});

  @override
  List<Object> get props => [product, quantity];
}

final class UpdateCartItemQuantity extends CartEvent {
  final String itemId;
  final int quantity;

  const UpdateCartItemQuantity(this.itemId, this.quantity);

  @override
  List<Object> get props => [itemId, quantity];
}

final class RemoveItemFromCart extends CartEvent {
  final String itemId;

  const RemoveItemFromCart(this.itemId);

  @override
  List<Object> get props => [itemId];
}

final class ClearCart extends CartEvent {
  const ClearCart();

  @override
  List<Object> get props => [];
}
