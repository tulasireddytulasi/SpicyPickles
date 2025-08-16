import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/model/model_exports.dart';
import 'package:spicypickles/app/presentation/cart/widgets/add_items_button.dart';
import 'package:spicypickles/app/presentation/home/widget/rating_widget.dart';

class FoodItemCard extends StatefulWidget {
  const FoodItemCard({
    super.key,
    this.cardSize = 140,
    required this.product,
  });

  final double cardSize;
  final Product product;

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  late final Product product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

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
                  product.title ?? "",
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500, // font-medium
                    color: AppTheme.gray800, // text-gray-800
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    StarRating(rating: product.rating?.toInt() ?? 0, filledColor: Colors.amber, starSize: 14.5),
                    const SizedBox(width: 4),
                    Text(
                      "(126+)",
                      style: context.textStyle?.bodySmall?.copyWith(
                        fontSize: 12,
                        color: AppColors.black,
                        fontFamily: "MontserratSemiBold",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Price
                Row(
                  children: [
                    Text(
                      '₹${product.price?.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.blackColor, // text-primary
                        fontWeight: FontWeight.w500, // font-medium
                      ),
                    ),
                    if (product.originalPrice != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // ml-2
                        child: Text(
                          '₹${product.originalPrice!.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12, // text-xs
                            color: AppTheme.gray500, // text-gray-500
                            decoration: TextDecoration.lineThrough, // line-through
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  product.description ?? '',
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12, // text-xs
                    color: AppTheme.gray500, // text-gray-500
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
                    imageUrl: product.imgUrl ?? "",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset(
                      product.imgUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      product.imgUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -16,
                right: 14,
                child: AddItemButton(
                  width: 110,
                  height: 40,
                  product: product,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
