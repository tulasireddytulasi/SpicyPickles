// Purpose: Data model for overall seller details.
// File: seller_details_model.dart
// Folder: lib/data/models/

import 'package:equatable/equatable.dart';

class SellerDetailsModel extends Equatable {
  final String name;
  final String tagline;
  final String logoUrl;
  final double overallRating;
  final int totalReviews;
  final String deliveryTime;
  final String distance;
  final List<String> features; // e.g., Featured, Pure Veg
  final List<String> offers; // e.g., 20% OFF Today, Free Delivery
  final String minOrder;
  final String description;
  final List<String> openingHours;
  final String contactPhone;
  final String contactEmail;
  final String mapImageUrl;

  const SellerDetailsModel({
    required this.name,
    required this.tagline,
    required this.logoUrl,
    required this.overallRating,
    required this.totalReviews,
    required this.deliveryTime,
    required this.distance,
    this.features = const [],
    this.offers = const [],
    required this.minOrder,
    required this.description,
    this.openingHours = const [],
    required this.contactPhone,
    required this.contactEmail,
    required this.mapImageUrl,
  });

  @override
  List<Object?> get props => [
    name,
    tagline,
    logoUrl,
    overallRating,
    totalReviews,
    deliveryTime,
    distance,
    features,
    offers,
    minOrder,
    description,
    openingHours,
    contactPhone,
    contactEmail,
    mapImageUrl,
  ];

  SellerDetailsModel copyWith({
    String? name,
    String? tagline,
    String? logoUrl,
    double? overallRating,
    int? totalReviews,
    String? deliveryTime,
    String? distance,
    List<String>? features,
    List<String>? offers,
    String? minOrder,
    String? description,
    List<String>? openingHours,
    String? contactPhone,
    String? contactEmail,
    String? mapImageUrl,
  }) {
    return SellerDetailsModel(
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      logoUrl: logoUrl ?? this.logoUrl,
      overallRating: overallRating ?? this.overallRating,
      totalReviews: totalReviews ?? this.totalReviews,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      distance: distance ?? this.distance,
      features: features ?? this.features,
      offers: offers ?? this.offers,
      minOrder: minOrder ?? this.minOrder,
      description: description ?? this.description,
      openingHours: openingHours ?? this.openingHours,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
      mapImageUrl: mapImageUrl ?? this.mapImageUrl,
    );
  }
}
