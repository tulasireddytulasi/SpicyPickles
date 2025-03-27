part of 'orders_bloc.dart';

@immutable
sealed class OrdersState extends Equatable {
  const OrdersState();
}

final class OrdersInitial extends OrdersState {
  const OrdersInitial();

  @override
  List<Object> get props => [];
}

final class OrdersLoading extends OrdersState {
  const OrdersLoading();

  @override
  List<Object> get props => [];
}

final class OrdersLoaded extends OrdersState {
  const OrdersLoaded({required this.ordersList});

  final List<Orders> ordersList;

  @override
  List<Object> get props => [];
}

final class OrderItemsError extends OrdersState {
  final String message;

  const OrderItemsError(this.message);

  @override
  List<Object?> get props => [message];
}