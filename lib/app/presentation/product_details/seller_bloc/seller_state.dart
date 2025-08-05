// Purpose: Defines states for the Seller Bloc.
// File: seller_state.dart
// Folder: lib/logic/blocs/seller/

part of 'seller_bloc.dart';

abstract class SellerState extends Equatable {
  const SellerState();

  @override
  List<Object> get props => [];
}

class SellerInitial extends SellerState {}

class SellerLoading extends SellerState {}

class SellerLoaded extends SellerState {
  final SellerDetailsModel sellerDetails;
  final List<ReviewModel> recentReviews;

  const SellerLoaded({
    required this.sellerDetails,
    this.recentReviews = const [],
  });

  @override
  List<Object> get props => [sellerDetails, recentReviews];

  SellerLoaded copyWith({
    SellerDetailsModel? sellerDetails,
    List<ReviewModel>? recentReviews,
  }) {
    return SellerLoaded(
      sellerDetails: sellerDetails ?? this.sellerDetails,
      recentReviews: recentReviews ?? this.recentReviews,
    );
  }
}

class SellerError extends SellerState {
  final String message;

  const SellerError(this.message);

  @override
  List<Object> get props => [message];
}
