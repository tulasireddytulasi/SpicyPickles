import 'dart:convert';
import 'package:spicypickles/app/model/products_model.dart';

CartItemsModel cartItemsModelFromJson(String str) => CartItemsModel.fromJson(json.decode(str));

String cartItemsModelToJson(CartItemsModel data) => json.encode(data.toJson());

class CartItemsModel {
  Product? product;
  int? quantity;

  CartItemsModel({
    this.product,
    this.quantity,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) => CartItemsModel(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "quantity": quantity,
  };
}
