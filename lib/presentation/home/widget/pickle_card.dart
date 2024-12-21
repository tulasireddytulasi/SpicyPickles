import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/cart/cart.dart';
import 'package:spicypickles/presentation/widgets/rating_widget.dart';

class PickleCard extends StatelessWidget {
  const PickleCard({
    super.key,
    required this.imgUrl,
    required this.description,
    required this.title,
  });

  final String imgUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        color: Colors.transparent, // Ensures the background color doesn't override the design
        borderRadius: const BorderRadius.all(Radius.circular(10)), // Matches the container's border radius
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)), // Ensures ripple effect matches the shape
          onTap: () async {
            await Future.delayed(const Duration(milliseconds: 200));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle?.bodySmall?.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                          fontFamily: "MontserratSemiBold",
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: RatingWidget(rating: "3.5"),
                    ),
                  ],
                ),
              ),
              Text(
                description,
                maxLines: 4,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle?.bodySmall?.copyWith(
                  fontSize: 14,
                  color: AppColors.mediumGrey,
                  fontFamily: "MontserratSemiBold",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 4),
                child: RichText(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "South Indian | Spicy | ",
                        style: context.textStyle?.bodySmall?.copyWith(
                          fontSize: 12,
                          color: AppColors.mediumGrey,
                          fontFamily: "MontserratSemiBold",
                        ),
                      ),
                      TextSpan(
                        text: "Rs 500 / 0.2 kg",
                        style: context.textStyle?.bodySmall?.copyWith(
                          fontSize: 12,
                          color: AppColors.vibrantRed,
                          fontFamily: "MontserratSemiBold",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
