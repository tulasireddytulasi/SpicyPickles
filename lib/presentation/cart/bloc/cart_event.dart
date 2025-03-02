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
