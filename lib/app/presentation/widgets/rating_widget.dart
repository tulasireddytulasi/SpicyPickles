import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';


class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 0, right: 0),
            child: Text(
              rating,
              textAlign: TextAlign.center,
              style: context.textStyle?.titleMedium?.copyWith(color: AppColors.white, fontSize: 12),
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.white,
            size: 10,
          ),
        ],
      ),
    );
  }
}
