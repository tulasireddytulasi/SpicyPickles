import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.timer,
            color: AppColors.green,
          ),
          SizedBox(width: 10),
          Text(
            "Delivery in 31 min",
            style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
