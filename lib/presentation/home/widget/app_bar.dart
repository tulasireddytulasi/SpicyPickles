import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/notifications/notification_screen.dart';
import 'package:spicypickles/presentation/widgets/circular_icon_widget.dart';

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
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: context.textStyle?.labelLarge?.copyWith(
                color: AppColors.black.withOpacity(0.8),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 2),
                Text(
                  'MVP Colony, Vizag',
                  style: context.textStyle?.labelLarge?.copyWith(
                    color: AppColors.black,
                    fontFamily: 'MontserratBold',
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(
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
