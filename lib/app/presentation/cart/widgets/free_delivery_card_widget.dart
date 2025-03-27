import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class FreeDeliveryCard extends StatelessWidget {
  const FreeDeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient:  const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[AppColors.lightPeach, AppColors.white],
        ),
      ),
      child: const Row(
        children: [
          Image(
            image: AssetImage(AppAssets.kChilliIcon),
            width: 24,
            height: 24,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(width: 10),
          Text(
            "Free delivery on orders above 1,000 Rs",
            style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
