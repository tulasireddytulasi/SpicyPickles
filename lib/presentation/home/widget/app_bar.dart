import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.themeData.primaryColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: context.textStyle?.labelLarge?.copyWith(
                color: AppColors.white.withOpacity(0.8),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 4),
                Text(
                  'MVP Colony, Vizag',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 28,
                ),
              ],
            ),
          ],
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            width: 36,
            height: 36,
            child: InkWell(
              onTap: (){},
              child:  ClipOval(
                child: ColoredBox(
                  color: AppColors.white,
                  child: Icon(Icons.notification_important_outlined, color: context.colorScheme?.primary),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
