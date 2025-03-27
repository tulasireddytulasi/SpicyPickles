import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/model/model_exports.dart';

import 'cart_widgets_export.dart';

class Items extends StatefulWidget {
  const Items({super.key, required this.product});
  final Product product;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  late final Product product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imgUrl ?? AppAssets.kChilliPickle,
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: screenWidth / 2,
                    child:  Text(
                      product.title ?? "Tender Coconut 1 pc (Approx 800 g - 1500 g)",
                      softWrap: true,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth / 2,
                    margin: const EdgeInsets.only(top: 4),
                    child: const Text(
                      "PRIVATE LABEL",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),
                  ),
                  Container(
                    width: screenWidth / 2,
                    margin: const EdgeInsets.only(top: 4),
                    child:  Text(
                      product.price ?? "₹49.00",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 2),
                  AddItemButton(noOfItems: 1, product: product),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
