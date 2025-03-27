import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({
    super.key,
    required this.size,
    required this.onTap,
    this.backgroundColor,
    required this.icon, this.padding,
  });

  final double size;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final IconData icon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: size,
        height: size,
        child: InkWell(
          onTap: onTap,
          child: ClipOval(
            child: ColoredBox(
              color: backgroundColor ?? AppColors.white,
              child: Icon(icon, color: context.colorScheme?.onSurface),
            ),
          ),
        ),
      ),
    );
  }
}
