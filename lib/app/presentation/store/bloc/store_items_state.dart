part of 'store_items_bloc.dart';

sealed class StoreItemsState extends Equatable {
  const StoreItemsState();
}

final class StoreItemsInitial extends StoreItemsState {
  @override
  List<Object> get props => [];
}

final class StoreItemsLoading extends StoreItemsState {
  const StoreItemsLoading();

  @override
  List<Object?> get props => [];
}

final class StoreItemsLoaded extends StoreItemsState {
  final List<Product> products;
  final int nextPageKey;

  const StoreItemsLoaded({required this.products, required this.nextPageKey});

  @override
  List<Object?> get props => [products, nextPageKey];
}

final class FetchItemsState extends StoreItemsState {
  final PagingState<int, Product> pagingState;

  const FetchItemsState(this.pagingState);

  @override
  List<Object?> get props => [pagingState];
}

final class StoreItemsError extends StoreItemsState {
  final String message;

  const StoreItemsError(this.message);

  @override
  List<Object?> get props => [message];
}
