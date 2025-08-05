// Purpose: Defines states for the Product Bloc.
// File: product_state.dart
// Folder: lib/logic/blocs/product/

// import 'package:equatable/equatable.dart';
// import 'package:spicypickles/app/data/models/product_model.dart';
part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> bestsellers;
  final List<ProductModel> specialOffers;
  final String activeCategory;

  const ProductLoaded({
    this.bestsellers = const [],
    this.specialOffers = const [],
    this.activeCategory = 'all',
  });

  @override
  List<Object> get props => [bestsellers, specialOffers, activeCategory];

  ProductLoaded copyWith({
    List<ProductModel>? bestsellers,
    List<ProductModel>? specialOffers,
    String? activeCategory,
  }) {
    return ProductLoaded(
      bestsellers: bestsellers ?? this.bestsellers,
      specialOffers: specialOffers ?? this.specialOffers,
      activeCategory: activeCategory ?? this.activeCategory,
    );
  }
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}
