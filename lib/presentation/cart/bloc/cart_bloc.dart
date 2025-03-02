import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spicypickles/model/products_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<AddItem>(_addItem);
    on<RemoveItem>(_removeItem);
    on<clearAllItem>(_clearAllItems);
  }

  final List<Product> productList = [];

  FutureOr<void> _addItem(AddItem event, Emitter<CartState> emit) {
    productList.add(event.product);
    emit(CartLoaded(productList: [...productList]));
  }

  FutureOr<void> _removeItem(RemoveItem event, Emitter<CartState> emit) {
    productList.remove(event.product);
    emit(CartLoaded(productList: [...productList]));
  }

  FutureOr<void> _clearAllItems(clearAllItem event, Emitter<CartState> emit) {
    productList.clear();
    emit(CartLoaded(productList: [...productList]));
  }
}
