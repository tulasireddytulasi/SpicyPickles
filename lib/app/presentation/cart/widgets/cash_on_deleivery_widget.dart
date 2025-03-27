import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class CashOnDeliveryWidget extends StatelessWidget {
  const CashOnDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.black,
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10),
        child: const Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.money_outlined,
                  size: 22,
                  color: AppColors.black,
                ),
                SizedBox(width: 2),
                Text(
                  "Pay using",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.black,
                    fontWeight: FontWeight.normal,
                    fontFamily: "montserratRegular",
                  ),
                ),
                Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 22,
                  color: AppColors.black,
                ),
              ],
            ),
            Text(
              "Cash on Delivery",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.black,
                fontWeight: FontWeight.normal,
                fontFamily: "montserratRegular",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
