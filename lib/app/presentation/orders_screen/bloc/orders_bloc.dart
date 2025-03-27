import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spicypickles/app/core/utils/dummy_data/orders_data.dart';
import 'package:spicypickles/app/model/model_exports.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial()) {
    on<FetchOrdersEvent>(_fetchOrders);
  }

  Future<void> _fetchOrders(FetchOrdersEvent event, Emitter<OrdersState> emit) async {
    try {
      emit(const OrdersLoading());
      await Future.delayed(Duration(milliseconds: 500));
      final ordersModel = ordersModelFromJson(json.encode(OrdersData.ordersData));
      final List<Orders> ordersList = ordersModel.ordersList ?? [];
      emit(OrdersLoaded(ordersList: ordersList));
    } catch (e, s) {
      log("FetchFoodItems Error: $e");
      log("FetchFoodItems Error Stack: $s");
      emit(const OrderItemsError("Failed to fetch products."));
    }
  }
}
