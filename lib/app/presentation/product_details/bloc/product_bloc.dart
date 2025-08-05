// Purpose: Manages product-related states and events.
// File: product_bloc.dart
// Folder: lib/logic/blocs/product/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/data/repositories/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spicypickles/app/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadProductsByCategory>(_onLoadProductsByCategory);
    on<LoadSpecialOffers>(_onLoadSpecialOffers);
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final bestsellers = await productRepository.fetchBestsellers();
      final specialOffers = await productRepository.fetchSpecialOffers();
      emit(ProductLoaded(
          bestsellers: bestsellers, specialOffers: specialOffers));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onLoadProductsByCategory(
      LoadProductsByCategory event, Emitter<ProductState> emit) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(currentState.copyWith(activeCategory: event.category));
      // In a real app, you would fetch products for the specific category here
      // For now, we'll just keep the existing bestsellers for demonstration
      // final products = await productRepository.fetchProductsByCategory(event.category);
      // emit(currentState.copyWith(products: products, activeCategory: event.category));
    }
  }

  Future<void> _onLoadSpecialOffers(
      LoadSpecialOffers event, Emitter<ProductState> emit) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      try {
        final specialOffers = await productRepository.fetchSpecialOffers();
        emit(currentState.copyWith(specialOffers: specialOffers));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }
}
