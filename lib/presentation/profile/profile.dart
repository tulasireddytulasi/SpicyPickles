import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/profile/widget/card_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
               child: ColoredBox(
                 color: AppColors.lightGrey.withOpacity(0.4),
                 child: const Column(
                   children: [
                    CardWidget(
                      iconUrl: AppAssets.kProfileIcon,
                      label: "Personal Info",
                      iconColor: AppColors.vibrantRed,
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kMapIcon,
                      label: "Addresses",
                      iconColor: AppColors.blue,
                    ),
                  ],
                 ),
               ),
             ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: ColoredBox(
                color: AppColors.lightGrey.withOpacity(0.4),
                child: const Column(
                  children: [
                    CardWidget(
                      iconUrl: AppAssets.kCartIcon,
                      label: "Cart",
                      iconColor: AppColors.skyBlue,
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kFavoriteIcon,
                      label: "Favourite",
                      iconColor: AppColors.purple,
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kNotificationIcon,
                      label: "Notifications",
                      iconColor: AppColors.vividOrange,
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kPaymentIcon,
                      label: "Payment Method",
                      iconColor: AppColors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: ColoredBox(
                color: AppColors.lightGrey.withOpacity(0.4),
                child: const Column(
                  children: [
                    CardWidget(
                      iconUrl: AppAssets.kHelpIcon,
                      label: "FAQs",
                      iconColor: AppColors.vibrantRed,
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kCMDKeyIcon,
                      label: "User Reviews",
                      iconColor: AppColors.blue,
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kSettingsIcon,
                      label: "Settings",
                      iconColor: AppColors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: ColoredBox(
                color: AppColors.lightGrey.withOpacity(0.4),
                child: const Column(
                  children: [
                    CardWidget(
                      iconUrl: AppAssets.kLogoutIcon,
                      label: "Logout",
                      iconColor: AppColors.vibrantRed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
