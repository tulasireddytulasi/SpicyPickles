import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/notifications/notification_screen.dart';
import 'package:spicypickles/app/presentation/widgets/widget_exports.dart';

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
      // elevation: 1,
      // shadowColor: AppColors.black,
      backgroundColor: context.themeData.colorScheme.onPrimary,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on_rounded, size: 22, color: AppColors.crimson,),
                SizedBox(width: 0),
                Text(
                  'Home',
                  style: context.textStyle?.labelLarge?.copyWith(
                    color: AppColors.black.withValues(alpha: 0.8),
                    fontSize: 16,
                    fontFamily: 'MontserratBold',
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 28,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                'MVP Colony, Sector -12, Vizag.',
                style: context.textStyle?.labelLarge?.copyWith(fontSize: 12, color: AppColors.darkGrey),
              ),
            ),
          ],
        ),
      ),
      centerTitle: false,
      actions: [
        CircularIconWidget(
          icon: Icons.notification_important_outlined,
          padding: const EdgeInsets.only(right: 8.0),
          backgroundColor: AppColors.silver,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            );
          },
          size: 36,
        ),
      ],
    );
  }
}
