import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_constants.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
    this.width = 100,
    this.height = 40,
    this.fontSize = 12,
  });

  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        border: Border.all(color: AppColors.vibrantRed, width: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          child: Text(
            AppConstants.kAdd,
            style: context.textStyle?.labelMedium?.copyWith(
              fontSize: fontSize,
              color: AppColors.vibrantRed,
              fontFamily: "MontserratBold",
            ),
          ),
        ),
      ),
    );
  }
}
