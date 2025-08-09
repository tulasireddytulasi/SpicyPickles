// Purpose: Displays a special offer item with image, name, description, price, discount, and an "Add" button.
// File: special_offer_card.dart
// Folder: lib/presentation/widgets/menu/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/models/product_model.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';

class SpecialOfferCard extends StatelessWidget {
  final ProductModel offer;

  const SpecialOfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero, // No external margin, handled by parent spacing
      elevation: 1, // shadow-sm
      shape: RoundedRectangleBorder(
        borderRadius: Theme.of(context).customBorderRadius.defaultRadius, // rounded-lg
      ),
      clipBehavior: Clip.antiAlias, // Ensures content respects rounded corners
      child: InkWell(
        onTap: () {
          // Handle tap on special offer item (e.g., navigate to offer detail screen)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on special offer: ${offer.name}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0), // p-4
          child: Row(
            children: [
              // Offer Image
              Container(
                width: 64, // w-16
                height: 64, // h-16
                margin: const EdgeInsets.only(right: 12.0), // mr-3
                decoration: BoxDecoration(
                  borderRadius: Theme.of(context).customBorderRadius.defaultRadius, // rounded-lg
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: Theme.of(context).customBorderRadius.defaultRadius,
                  child: Image.network(
                    offer.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppTheme.gray100,
                      child: const Icon(Icons.broken_image, color: AppTheme.gray500),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Offer Name
                    Text(
                      offer.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500, // font-medium
                        color: AppTheme.gray800, // text-gray-800
                      ),
                    ),
                    const SizedBox(height: 4), // mt-1 (approx)
                    // Offer Description
                    Text(
                      offer.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12, // text-xs
                        color: AppTheme.gray600, // text-gray-600
                      ),
                    ),
                    const SizedBox(height: 4), // mt-1 (approx)
                    // Price and Discount
                    Row(
                      children: [
                        Text(
                          '\$${offer.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.primaryColor, // text-primary
                            fontWeight: FontWeight.w500, // font-medium
                          ),
                        ),
                        if (offer.originalPrice != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0), // ml-2
                            child: Text(
                              '\$${offer.originalPrice!.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 12, // text-xs
                                color: AppTheme.gray500, // text-gray-500
                                decoration: TextDecoration.lineThrough, // line-through
                              ),
                            ),
                          ),
                        if (offer.tags.isNotEmpty)
                          ...offer.tags.map((tag) => Padding(
                            padding: const EdgeInsets.only(left: 8.0), // ml-2
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0), // px-1.5 py-0.5
                              decoration: BoxDecoration(
                                color: AppTheme.secondaryColor.withValues(alpha: 0.2), // bg-secondary/20
                                borderRadius: Theme.of(context).customBorderRadius.defaultRadius, // rounded
                              ),
                              child: Text(
                                tag,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 10, // text-xs
                                  color: AppTheme.secondaryColor, // text-secondary
                                ),
                              ),
                            ),
                          )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8), // Spacing before button
              // Add Button
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final bool isInCart = state is CartLoaded2 &&
                      state.items.any((item) => item.id == offer.id);

                  return ElevatedButton(
                    onPressed: isInCart
                        ? null // Disable if already in cart (or change to 'Added' text)
                        : () {
                      context.read<CartBloc>().add(AddItemToCart(offer));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added ${offer.name} to cart')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor, // bg-primary
                      foregroundColor: AppTheme.whiteColor, // text-white
                      shape: RoundedRectangleBorder(
                        borderRadius: Theme.of(context).customBorderRadius.button, // rounded-button
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0), // px-3 py-1.5
                      minimumSize: Size.zero, // Remove default minimum size
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink tap area
                    ),
                    child: Text(
                      isInCart ? 'Added' : 'Add',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14, // text-sm
                        fontWeight: FontWeight.w500, // font-medium
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
