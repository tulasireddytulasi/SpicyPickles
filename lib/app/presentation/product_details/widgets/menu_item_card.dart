// Purpose: Represents a single menu item with image, name, rating, description, price, and add/quantity control.
// File: menu_item_card.dart
// Folder: lib/presentation/widgets/menu/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/models/cart_item_model.dart';
import 'package:spicypickles/app/data/models/product_model.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';
import 'package:collection/collection.dart';


class MenuItemCard extends StatelessWidget {
  final ProductModel product;

  const MenuItemCard({super.key, required this.product});

  // Helper to build star rating icons
  Widget _buildStarRating(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(const Icon(Icons.star, color: AppTheme.secondaryColor, size: 14)); // ri-star-fill text-xs
      } else if (i - rating < 1 && i - rating > 0) {
        stars.add(const Icon(Icons.star_half, color: AppTheme.secondaryColor, size: 14)); // ri-star-half-fill text-xs
      } else {
        stars.add(const Icon(Icons.star_border, color: AppTheme.secondaryColor, size: 14)); // ri-star-line text-xs
      }
    }
    return Row(children: stars);
  }

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
          // Handle tap on menu item (e.g., navigate to product detail screen)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on ${product.name}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0), // p-3
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( // This Expanded ensures the left column takes available space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name and Tags
                    Row(
                      children: [
                        Expanded( // FIX: Wrap product name with Expanded to prevent overflow
                          child: Text(
                            product.name,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500, // font-medium
                              color: AppTheme.gray800, // text-gray-800
                            ),
                            overflow: TextOverflow.ellipsis, // Add ellipsis for long names
                            softWrap: false, // Prevent wrapping to keep it single line
                          ),
                        ),
                        if (product.tags.isNotEmpty)
                          ...product.tags.map((tag) => Padding(
                            padding: const EdgeInsets.only(left: 8.0), // gap-2
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0), // px-2 py-0.5
                              decoration: BoxDecoration(
                                color: tag == 'Spicy'
                                    ? AppTheme.red100 // bg-red-100
                                    : AppTheme.secondaryColor.withOpacity(0.2), // bg-secondary/20
                                borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                              ),
                              child: Text(
                                tag,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 10, // text-xs
                                  color: tag == 'Spicy'
                                      ? AppTheme.red600 // text-red-600
                                      : AppTheme.secondaryColor, // text-secondary
                                ),
                                overflow: TextOverflow.ellipsis, // Also add for tags
                                softWrap: false,
                              ),
                            ),
                          )),
                      ],
                    ),
                    const SizedBox(height: 4), // mt-1 (approx)
                    // Rating
                    Row(
                      children: [
                        _buildStarRating(product.rating),
                        const SizedBox(width: 4), // ml-1
                        Text(
                          '${product.rating.toStringAsFixed(1)} (${product.reviewsCount}+)',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12, // text-xs
                            color: AppTheme.gray500, // text-gray-500
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4), // mt-1 (approx)
                    // Description
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12, // text-xs
                        color: AppTheme.gray500, // text-gray-500
                      ),
                      maxLines: 2, // Limit description to 2 lines
                      overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
                    ),
                    const SizedBox(height: 8), // mt-2 (approx)
                    // Price
                    Row(
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.primaryColor, // text-primary
                            fontWeight: FontWeight.w500, // font-medium
                          ),
                        ),
                        if (product.originalPrice != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0), // ml-2
                            child: Text(
                              '\$${product.originalPrice!.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 12, // text-xs
                                color: AppTheme.gray500, // text-gray-500
                                decoration: TextDecoration.lineThrough, // line-through
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12), // Spacing between text and image
              // Product Image and Quantity Control
              Stack(
                alignment: Alignment.bottomRight, // absolute -bottom-2 right-0
                children: [
                  ClipRRect(
                    borderRadius: Theme.of(context).customBorderRadius.defaultRadius, // rounded-lg
                    child: Image.network(
                      product.imageUrl,
                      width: 96, // w-24
                      height: 96, // h-24
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 96,
                        height: 96,
                        color: AppTheme.gray100,
                        child: const Icon(Icons.broken_image, color: AppTheme.gray500),
                      ),
                    ),
                  ),
                  // Quantity Control (positioned on top of the image)
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      int currentQuantity = 0;
                      if (state is CartLoaded2) {
                        final CartItemModel? cartItem = state.items.firstWhereOrNull(
                              (item) => item.id == product.id,
                        );
                        if (cartItem != null) {
                          currentQuantity = cartItem.quantity;
                        }
                      }

                      return Transform.translate(
                        offset: const Offset(0, 8), // -bottom-2 in HTML (approx 8px from bottom)
                        child: currentQuantity == 0
                            ? GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(AddItemToCart(product));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added ${product.name} to cart')),
                            );
                          },
                          child: Container(
                            width: 32, // w-8
                            height: 32, // h-8
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor, // bg-primary
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2), // shadow-lg
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add, // ri-add-line
                              color: AppTheme.whiteColor,
                              size: 20,
                            ),
                          ),
                        )
                            : Container(
                          height: 32, // h-8
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor, // bg-primary
                            borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2), // shadow-lg
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (currentQuantity > 1) {
                                    context.read<CartBloc>().add(UpdateCartItemQuantity(product.id, currentQuantity - 1));
                                  } else {
                                    context.read<CartBloc>().add(RemoveItemFromCart(product.id));
                                  }
                                },
                                child: Container(
                                  width: 32, // w-8
                                  height: 32, // h-8
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.remove, // ri-subtract-line
                                    color: AppTheme.whiteColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 32, // w-8
                                child: Text(
                                  currentQuantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<CartBloc>().add(UpdateCartItemQuantity(product.id, currentQuantity + 1));
                                },
                                child: Container(
                                  width: 32, // w-8
                                  height: 32, // h-8
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.add, // ri-add-line
                                    color: AppTheme.whiteColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

