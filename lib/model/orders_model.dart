// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  int? totalResults;
  int? page;
  List<OrdersList>? ordersList;

  OrdersModel({
    this.totalResults,
    this.page,
    this.ordersList,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    totalResults: json["totalResults"],
    page: json["page"],
    ordersList: json["ordersList"] == null ? [] : List<OrdersList>.from(json["ordersList"]!.map((x) => OrdersList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "page": page,
    "ordersList": ordersList == null ? [] : List<dynamic>.from(ordersList!.map((x) => x.toJson())),
  };
}

class OrdersList {
  String? orderDate;
  String? orderId;
  String? deliveryAddress;
  String? orderDeliveredDate;
  int? itemTotal;
  int? taxes;
  int? coupon;
  String? couponName;
  int? deliveryCharges;
  int? restPackingCharges;
  int? platformFees;
  String? payment;
  int? phoneNo;
  List<Item>? items;

  OrdersList({
    this.orderDate,
    this.orderId,
    this.deliveryAddress,
    this.orderDeliveredDate,
    this.itemTotal,
    this.taxes,
    this.coupon,
    this.couponName,
    this.deliveryCharges,
    this.restPackingCharges,
    this.platformFees,
    this.payment,
    this.phoneNo,
    this.items,
  });

  factory OrdersList.fromJson(Map<String, dynamic> json) => OrdersList(
    orderDate: json["orderDate"],
    orderId: json["orderId"],
    deliveryAddress: json["deliveryAddress"],
    orderDeliveredDate: json["orderDeliveredDate"],
    itemTotal: json["itemTotal"],
    taxes: json["taxes"],
    coupon: json["coupon"],
    couponName: json["couponName"],
    deliveryCharges: json["deliveryCharges"],
    restPackingCharges: json["restPackingCharges"],
    platformFees: json["platformFees"],
    payment: json["payment"],
    phoneNo: json["phoneNo"],
    items: json["Items"] == null ? [] : List<Item>.from(json["Items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderDate": orderDate,
    "orderId": orderId,
    "deliveryAddress": deliveryAddress,
    "orderDeliveredDate": orderDeliveredDate,
    "itemTotal": itemTotal,
    "taxes": taxes,
    "coupon": coupon,
    "couponName": couponName,
    "deliveryCharges": deliveryCharges,
    "restPackingCharges": restPackingCharges,
    "platformFees": platformFees,
    "payment": payment,
    "phoneNo": phoneNo,
    "Items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? restaurantName;
  String? itemName;
  int? price;
  double? rating;
  int? noOfItems;

  Item({
    this.restaurantName,
    this.itemName,
    this.price,
    this.rating,
    this.noOfItems,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    restaurantName: json["restaurantName"],
    itemName: json["itemName"],
    price: json["price"],
    rating: json["rating"]?.toDouble(),
    noOfItems: json["noOfItems"],
  );

  Map<String, dynamic> toJson() => {
    "restaurantName": restaurantName,
    "itemName": itemName,
    "price": price,
    "rating": rating,
    "noOfItems": noOfItems,
  };
}
