import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/product_list/widgets/add_button.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.description,
  });

  final String imgUrl;
  final String title;
  final String description;
  final String price;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.blush,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        width: 140,
        height: 210,
        child: Column(
          children: [
            Image.asset(
              widget.imgUrl,
              fit: BoxFit.cover,
              height: 140,
            ),
            SizedBox(
              width: double.infinity,
              height: 18,
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Text(
                  widget.title,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.headlineMedium?.copyWith(fontSize: 14, color: AppColors.black),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 34,
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Text(
                  widget.description,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.bodySmall?.copyWith(
                    fontSize: 10,
                    color: AppColors.black,
                    fontFamily: "MontserratSemiBold",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.price,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle?.headlineMedium?.copyWith(
                      fontSize: 12,
                      color: AppColors.black,
                      fontFamily: 'MontserratBold',
                    ),
                  ),
                  const AddItemButton(width: 60, height: 26),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
