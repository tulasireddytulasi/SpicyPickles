// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  int? totalResults;
  int? page;
  List<Orders>? ordersList;

  OrdersModel({
    this.totalResults,
    this.page,
    this.ordersList,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    totalResults: json["totalResults"],
    page: json["page"],
    ordersList: json["ordersList"] == null ? [] : List<Orders>.from(json["ordersList"]!.map((x) => Orders.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "page": page,
    "ordersList": ordersList == null ? [] : List<dynamic>.from(ordersList!.map((x) => x.toJson())),
  };
}

class Orders {
  String? orderDate;
  String? orderId;
  String? deliveryAddress;
  String? orderDeliveredDate;
  int? totalPrice;
  int? taxes;
  int? coupon;
  String? couponName;
  int? deliveryCharges;
  int? restPackingCharges;
  String? restaurantName;
  String? restaurantLocation;
  int? platformFees;
  String? payment;
  int? phoneNo;
  List<Item>? items;

  Orders({
    this.orderDate,
    this.orderId,
    this.deliveryAddress,
    this.orderDeliveredDate,
    this.totalPrice,
    this.taxes,
    this.coupon,
    this.couponName,
    this.deliveryCharges,
    this.restPackingCharges,
    this.restaurantName,
    this.restaurantLocation,
    this.platformFees,
    this.payment,
    this.phoneNo,
    this.items,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    orderDate: json["orderDate"],
    orderId: json["orderId"],
    deliveryAddress: json["deliveryAddress"],
    orderDeliveredDate: json["orderDeliveredDate"],
    totalPrice: json["totalPrice"],
    taxes: json["taxes"],
    coupon: json["coupon"],
    couponName: json["couponName"],
    deliveryCharges: json["deliveryCharges"],
    restPackingCharges: json["restPackingCharges"],
    restaurantName: json["restaurantName"],
    restaurantLocation: json["restaurantLocation"],
    platformFees: json["platformFees"],
    payment: json["payment"],
    phoneNo: json["phoneNo"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderDate": orderDate,
    "orderId": orderId,
    "deliveryAddress": deliveryAddress,
    "orderDeliveredDate": orderDeliveredDate,
    "totalPrice": totalPrice,
    "taxes": taxes,
    "coupon": coupon,
    "couponName": couponName,
    "deliveryCharges": deliveryCharges,
    "restPackingCharges": restPackingCharges,
    "restaurantName": restaurantName,
    "restaurantLocation": restaurantLocation,
    "platformFees": platformFees,
    "payment": payment,
    "phoneNo": phoneNo,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? itemName;
  int? price;
  double? rating;
  int? noOfItems;
  bool? isVeg;

  Item({
    this.itemName,
    this.price,
    this.rating,
    this.noOfItems,
    this.isVeg,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemName: json["itemName"],
    price: json["price"],
    rating: json["rating"]?.toDouble(),
    noOfItems: json["noOfItems"],
    isVeg: json["isVeg"],
  );

  Map<String, dynamic> toJson() => {
    "itemName": itemName,
    "price": price,
    "rating": rating,
    "noOfItems": noOfItems,
    "isVeg": isVeg,
  };
}
