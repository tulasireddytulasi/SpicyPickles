import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spicypickles/app/model/model_exports.dart';
import 'package:spicypickles/app/presentation/product_list/widgets/products_list_data.dart';

part 'store_items_event.dart';

part 'store_items_state.dart';

class StoreItemsBloc extends Bloc<StoreItemsEvent, StoreItemsState> {
  StoreItemsBloc() : super(StoreItemsInitial()) {
    on<FetchFoodItemsEvent>(_fetchFoodItems);
  }

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
}
