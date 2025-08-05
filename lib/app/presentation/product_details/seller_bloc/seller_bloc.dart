// Purpose: Manages seller details and reviews states and events.
// File: seller_bloc.dart
// Folder: lib/logic/blocs/seller/

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/data/models/review_model.dart';
import 'package:spicypickles/app/data/models/seller_details_model.dart';
import 'package:spicypickles/app/data/repositories/seller_repository.dart';

part 'seller_event.dart';
part 'seller_state.dart';

class SellerBloc extends Bloc<SellerEvent, SellerState> {
  final SellerRepository sellerRepository;

  SellerBloc({required this.sellerRepository}) : super(SellerInitial()) {
    on<LoadSellerDetails>(_onLoadSellerDetails);
  }

  Future<void> _onLoadSellerDetails(
      LoadSellerDetails event, Emitter<SellerState> emit) async {
    emit(SellerLoading());
    try {
      final sellerDetails = await sellerRepository.fetchSellerDetails();
      final recentReviews = await sellerRepository.fetchRecentReviews();
      emit(SellerLoaded(
          sellerDetails: sellerDetails, recentReviews: recentReviews));
    } catch (e) {
      emit(SellerError(e.toString()));
    }
  }
}
