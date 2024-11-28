import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ProfileAppBarState extends State<ProfileAppBar> {
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
        "My Profile",
        style: context.textStyle?.labelLarge?.copyWith(color: AppColors.white, fontSize: 18),
      ),
      centerTitle: false,
    );
  }
}
