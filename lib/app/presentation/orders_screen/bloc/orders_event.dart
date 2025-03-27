part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent extends Equatable {
  const OrdersEvent();
}

final class FetchOrdersEvent extends OrdersEvent {
  const FetchOrdersEvent();

  @override
  List<Object?> get props => [];
}
