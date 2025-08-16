import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/app/model/model_exports.dart';
import 'package:spicypickles/app/presentation/product_list/widgets/products_list_data.dart';

part 'store_items_event.dart';

part 'store_items_state.dart';

class StoreItemsBloc extends Bloc<StoreItemsEvent, StoreItemsState> {
  StoreItemsBloc() : super(StoreItemsInitial()) {
    on<FetchFoodItemsEvent>(_fetchFoodItems);
    on<FetchPagingStateEvent>(_fetchPagingState);
  }

  PagingState<int, Product> _state = PagingState();

  FutureOr<void> _fetchFoodItems(FetchFoodItemsEvent event, Emitter<StoreItemsState> emit) {
    try {
      emit(const StoreItemsLoading());
      final productsModel = productsModelFromJson(json.encode(RepoData.data2));
      final List<Product> productList = productsModel.products ?? [];
      emit(StoreItemsLoaded(products: productList, nextPageKey: event.pageKey));
    } catch (e, s) {
      log("FetchFoodItems Error: $e");
      log("FetchFoodItems Error Stack: $s");
      emit(const StoreItemsError("Failed to fetch products."));
    }
  }

  FutureOr<void> _fetchPagingState(FetchPagingStateEvent event, Emitter<StoreItemsState> emit) async {
    try {
      if (_state.isLoading) return;

      // 1. Correctly update the state to loading
      _state = _state.copyWith(isLoading: true, error: null);
      emit(FetchItemsState(_state)); // First emit: to show a loading state

      try {
        final newKey = (_state.keys?.last ?? 0) + 1;
        final productsModel = productsModelFromJson(json.encode(RepoData.data2));
        final List<Product> productList = productsModel.products ?? [];
        final isLastPage = productList.isEmpty;

        // 2. Correctly update the state with new data
        _state = _state.copyWith(
          pages: [...?_state.pages, productList],
          keys: [...?_state.keys, newKey],
          hasNextPage: !isLastPage,
          isLoading: false,
        );

        emit(FetchItemsState(_state)); // Second emit: to show the new data
      } catch (error, stack) {
        log("FetchFoodItems Error 1: $error");
        log("FetchFoodItems Error Stack 1: $stack");

        // 3. Correctly update the state with an error
        _state = _state.copyWith(
          error: error,
          isLoading: false,
        );
        emit(FetchItemsState(_state)); // Third emit: to show the error
      }
    } catch (e, s) {
      log("FetchFoodItems Error: $e");
      log("FetchFoodItems Error Stack: $s");
      emit(const StoreItemsError("Failed to fetch products.")); // Final emit for a general error
    }
  }
}
