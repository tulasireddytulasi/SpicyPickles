// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  List<Product>? products;

  ProductsModel({
    this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  String? imgUrl;
  String? title;
  String? description;
  String? price;
  double? rating;

  Product({
    this.imgUrl,
    this.title,
    this.description,
    this.price,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    imgUrl: json["imgUrl"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "imgUrl": imgUrl,
    "title": title,
    "description": description,
    "price": price,
    "rating": rating,
  };
}
