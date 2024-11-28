import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class CartAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  State<CartAppBar> createState() => _CartAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CartAppBarState extends State<CartAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.colorScheme?.primary,
      titleSpacing: 0,
      leading: GestureDetector(
        child: const Icon(Icons.arrow_back),
      ),
      title: Text(
        "My Cart",
        style: context.textStyle?.labelLarge?.copyWith(color: AppColors.white, fontSize: 18),
      ),
      centerTitle: false,
    );
  }
}
