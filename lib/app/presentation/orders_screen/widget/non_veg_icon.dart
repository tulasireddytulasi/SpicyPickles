import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class CustomButton extends StatelessWidget {
  final double size = 12;
  final double iconSize = 8;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: AppColors.rubyRed, width: 1),
        ),
        child: Center(
          child: Image.asset(
            AppAssets.arrowDropUpIcon,
            width: iconSize,
            height: iconSize,
          ),
        ),
      ),
    );
  }
}
