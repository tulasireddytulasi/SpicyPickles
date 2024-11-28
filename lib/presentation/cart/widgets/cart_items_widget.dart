import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/cart/widgets/add_items_button.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
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
              AppAssets.kChilliPickle,
              width: 100,
              height: 130,
              fit: BoxFit.fitHeight,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                  //   border: Border.all(color: black, width: 1),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: screenWidth / 2,
                    child: const Text(
                      "Tender Coconut 1 pc (Approx 800 g - 1500 g)",
                      softWrap: true,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
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
                    child: const Text(
                      "₹49.00",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const AddItemButton(noOfItems: 1),
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
