// Purpose: Shows the seller's logo, special offers (e.g., "20% OFF Today", "Free Delivery"), and quick details (delivery time, minimum order).
// File: seller_quick_info.dart
// Folder: lib/presentation/widgets/seller_details/

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/data/models/seller_details_model.dart' show SellerDetailsModel;

class SellerQuickInfo extends StatelessWidget {
  final SellerDetailsModel sellerDetails;

  const SellerQuickInfo({super.key, required this.sellerDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // px-4 py-4
      decoration: const BoxDecoration(
        color: AppTheme.whiteColor, // bg-white
        border: Border(bottom: BorderSide(color: AppTheme.gray100, width: 1.0)), // border-b
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Seller Logo
          Container(
            width: 56, // w-14 (14 * 4 = 56px)
            height: 56, // h-14
            decoration: BoxDecoration(
              borderRadius: Theme.of(context).customBorderRadius.xl, // rounded-xl
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), // shadow-sm
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: Theme.of(context).customBorderRadius.xl,
              child: Image.network(
                sellerDetails.logoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppTheme.gray100,
                  child: const Icon(Icons.store, color: AppTheme.gray500),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16), // gap-4
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Special Offers
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0), // mb-2
                  child: Wrap(
                    spacing: 8.0, // gap-2
                    runSpacing: 8.0,
                    children: [
                      if (sellerDetails.offers.isNotEmpty)
                        ...sellerDetails.offers.map((offer) {
                          Color bgColor = AppTheme.primaryColor.withOpacity(0.1); // bg-primary/10
                          Color textColor = AppTheme.primaryColor; // text-primary

                          if (offer.contains('Free Delivery')) {
                            bgColor = AppTheme.secondaryColor.withOpacity(0.1); // bg-secondary/10
                            textColor = AppTheme.secondaryColor; // text-secondary
                          }

                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0), // px-2.5 py-1
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: Theme.of(context).customBorderRadius.full, // rounded-full
                            ),
                            child: Text(
                              offer,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 10, // text-xs
                                fontWeight: FontWeight.w500, // font-medium
                                color: textColor,
                              ),
                            ),
                          );
                        }),
                    ],
                  ),
                ),
                // Quick Details (Delivery Time, Min Order)
                Row(
                  children: [
                    // Delivery Time
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time, // ri-time-line
                          color: AppTheme.gray500,
                          size: 16, // icon size
                        ),
                        const SizedBox(width: 4), // gap-1
                        Text(
                          sellerDetails.deliveryTime.split('-').first.trim(), // "30 min" from "30-40 min"
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontSize: 12, // text-xs
                            color: AppTheme.gray500, // text-gray-500
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12), // gap-3
                    // Separator Dot
                    Container(
                      width: 4, // w-1
                      height: 4, // h-1
                      decoration: BoxDecoration(
                        color: AppTheme.gray300, // bg-gray-300
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12), // gap-3
                    // Minimum Order
                    Row(
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined, // ri-shopping-bag-line
                          color: AppTheme.gray500,
                          size: 16, // icon size
                        ),
                        const SizedBox(width: 4), // gap-1
                        Text(
                          'Min ${sellerDetails.minOrder}', // Min $20
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontSize: 12, // text-xs
                            color: AppTheme.gray500, // text-gray-500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
