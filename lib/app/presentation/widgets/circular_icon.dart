import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize, this.width,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double? iconSize;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightBlue,
      ),
      width: width,
      child: IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
