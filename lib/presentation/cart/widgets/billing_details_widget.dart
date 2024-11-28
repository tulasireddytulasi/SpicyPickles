import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/widgets/dash_line_divider_widget.dart';

class BillingDetailsWidget extends StatefulWidget {
  const BillingDetailsWidget({super.key});

  @override
  State<BillingDetailsWidget> createState() => _BillingDetailsWidgetState();
}

class _BillingDetailsWidgetState extends State<BillingDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        //  border: Border.all(color: black, width: 1),
        borderRadius: BorderRadius.circular(14),
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
                  color: AppColors.vibrantRed,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "Bill Summary",
                style: TextStyle(
                    color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Item total",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹196.00",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coupon - (FLAT20)",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹-80.00",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery charges",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "₹26.00",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Govt. taxes ",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.info_outline,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "₹41.21",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const DashLineDivider(color: Colors.grey),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grand total",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹183.21",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
