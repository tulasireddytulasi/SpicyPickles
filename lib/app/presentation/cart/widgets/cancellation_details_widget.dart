import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class CancellationInfoWidget extends StatefulWidget {
  const CancellationInfoWidget({super.key});

  @override
  State<CancellationInfoWidget> createState() => _CancellationInfoWidgetState();
}

class _CancellationInfoWidgetState extends State<CancellationInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        //  border: Border.all(color: black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Cancellation Policy",
            style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "100% cancellation fee will be applicable "
            "if you decide to cancel the order anytime after order placement.",
            style: TextStyle(color: AppColors.grey, fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
