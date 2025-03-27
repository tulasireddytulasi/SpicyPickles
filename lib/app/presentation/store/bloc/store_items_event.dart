part of 'store_items_bloc.dart';

sealed class StoreItemsEvent extends Equatable {
  const StoreItemsEvent();
}

final class FetchFoodItemsEvent extends StoreItemsEvent {
  final int pageKey;

  const FetchFoodItemsEvent({required this.pageKey});

  @override
  List<Object?> get props => [pageKey];
}
