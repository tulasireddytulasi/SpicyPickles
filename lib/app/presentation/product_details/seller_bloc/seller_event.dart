// Purpose: Defines events for the Seller Bloc.
// File: seller_event.dart
// Folder: lib/logic/blocs/seller/

part of 'seller_bloc.dart';

abstract class SellerEvent extends Equatable {
  const SellerEvent();

  @override
  List<Object> get props => [];
}

class LoadSellerDetails extends SellerEvent {
  const LoadSellerDetails();
}
