import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class ExploreAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ExploreAppBar({super.key});

  @override
  State<ExploreAppBar> createState() => _ExploreAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ExploreAppBarState extends State<ExploreAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      backgroundColor: context.colorScheme?.onPrimary,
      titleSpacing: 0,
      leading: GestureDetector(
        child: const Icon(Icons.arrow_back),
      ),
      title: Text(
        "My Pickles",
        style: context.textStyle?.labelLarge?.copyWith(color: AppColors.black, fontSize: 18),
      ),
      centerTitle: false,
    );
  }
}
