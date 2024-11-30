import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/coupons_screen/coupons_screen.dart';
import 'package:spicypickles/presentation/coupons_screen/widgets/coupon_applied_dilaog.dart';

class CouponsWidget extends StatelessWidget {
  const CouponsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CouponsScreen()),
        ).then((value) {
          if (value) {
            couponAppliedDialogBox(
              buildContext: context,
              height: 260,
              width: screenWidth - 40,
              couponId: "SPICY",
              discount: "10",
            );
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          //  border: Border.all(color: black, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Use coupons",
                  style: TextStyle(
                      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: AppColors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
