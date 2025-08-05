// Purpose: Defines events for the Product Bloc.
// File: product_event.dart
// Folder: lib/logic/blocs/product/

part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  const LoadProducts();
}

class LoadProductsByCategory extends ProductEvent {
  final String category;

  const LoadProductsByCategory(this.category);

  @override
  List<Object> get props => [category];
}

class LoadSpecialOffers extends ProductEvent {
  const LoadSpecialOffers();
}
