import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/widgets/widget_exports.dart';

class ItemCard2 extends StatefulWidget {
  const ItemCard2({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.price,
    this.maxLines = 2,
    required this.onTap,
  });

  final String imgUrl;
  final String title;
  final String description;
  final double price;
  final int maxLines;
  final VoidCallback onTap;

  @override
  State<ItemCard2> createState() => _ItemCard2State();
}

class _ItemCard2State extends State<ItemCard2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shadowColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: widget.imgUrl,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    widget.imgUrl,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    widget.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 70,
                      child: Text(
                        widget.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: context.textStyle?.headlineMedium?.copyWith(fontSize: 18, color: AppColors.black),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: RatingWidget(rating: "4.5"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "South Indian | Mutton Pickle | Rs 500/ 0.2 kg",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: widget.maxLines,
                  textAlign: TextAlign.start,
                  style: context.textStyle?.bodySmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.mediumGrey,
                    fontFamily: "MontserratSemiBold",
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: DashLineDivider(color: Colors.grey, dashWidth: 4.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.kDiscountIcon, width: 20, fit: BoxFit.cover, color: AppColors.darkBlue),
                    const SizedBox(width: 10),
                    Text(
                      "30% Off up to  Rs 50",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: context.textStyle?.headlineMedium?.copyWith(fontSize: 14, color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
