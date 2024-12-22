import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/cart/widgets/add_items_button.dart';
import 'package:spicypickles/presentation/home/widget/rating_widget.dart';

class FoodItemCard extends StatefulWidget {
  const FoodItemCard({
    super.key,
    this.cardSize = 140,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.isVeg,
    required this.isBestseller,
    required this.rating,
  });

  final double cardSize;
  final String title;
  final String price;
  final String description;
  final String imageUrl;
  final bool isVeg;
  final bool isBestseller;
  final double rating;

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.bodySmall?.copyWith(
                    fontSize: 16,
                    color: AppColors.black,
                    fontFamily: "MontserratSemiBold",
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    StarRating(rating: widget.rating.toInt(), filledColor: Colors.amber, starSize: 14.5),
                    const SizedBox(width: 4),
                    Text(
                      "(126)",
                      style: context.textStyle?.bodySmall?.copyWith(
                        fontSize: 12,
                        color: AppColors.black,
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  widget.price,
                  style: context.textStyle?.bodySmall?.copyWith(
                    fontSize: 14,
                    color: AppColors.black,
                    fontFamily: "MontserratSemiBold",
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.description,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.bodySmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.mediumGrey,
                    fontFamily: "MontserratSemiBold",
                  ),
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: widget.cardSize,
                height: widget.cardSize,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Positioned(bottom: -10, right: 14, child: AddItemButton(width: 110, height: 36)),
            ],
          ),
        ],
      ),
    );
  }
}