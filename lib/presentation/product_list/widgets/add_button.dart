import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_constants.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({super.key, this.width = 100, this.height = 40});

  final double width;
  final double height;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  late int noOfItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
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
              color: AppColors.vibrantRed,
              fontFamily: "MontserratBold",
            ),
          ),
        ),
      ),
    );
  }
}
