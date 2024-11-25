import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/home/widget/rating_widget.dart';
import 'package:spicypickles/presentation/product_list/widgets/add_button.dart';

class HorizontalItemCard extends StatelessWidget {
  const HorizontalItemCard({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
  });
  final String imgUrl;
  final String title;
  final String description;
  final String price;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){},
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: ColoredBox(
            color: AppColors.lightGrey.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 0),
                      Text(
                        title,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle?.headlineMedium?.copyWith(fontSize: 14, color: AppColors.black),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        width: 210,
                        child: Text(
                          description,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyle?.bodySmall?.copyWith(
                            fontSize: 12,
                            color: AppColors.charcoal,
                            fontFamily: "MontserratSemiBold",
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                       ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        child: ColoredBox(
                          color: AppColors.lightPeach,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: StarRating(rating: rating, filledColor: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            price,
                            style: context.textStyle?.bodySmall?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.charcoal,
                              decorationThickness: 2,
                              fontSize: 12,
                              color: AppColors.charcoal,
                              fontFamily: "MontserratSemiBold",
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Get for ${price}",
                            style: context.textStyle?.bodySmall?.copyWith(
                              fontSize: 12,
                              color: AppColors.darkBlue,
                              fontFamily: "MontserratSemiBold",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const AddItemButton(width: 100, height: 36, fontSize: 18),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                        height: 140,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}