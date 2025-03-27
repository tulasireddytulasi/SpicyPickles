import 'package:spicypickles/app/model/orders_model.dart';

abstract class OrdersHistory {
  Future<List<Orders>> fetchOrdersList();
}
