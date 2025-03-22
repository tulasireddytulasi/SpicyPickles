import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/orders_screen/orders_screen.dart';
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
                color: AppColors.lightGrey.withValues(alpha: 0.4),
                child: Column(
                  children: [
                    CardWidget(
                      iconUrl: AppAssets.kProfileIcon,
                      label: "Personal Info",
                      iconColor: AppColors.vibrantRed,
                      onTap: () {},
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kMapIcon,
                      label: "Addresses",
                      iconColor: AppColors.blue,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: ColoredBox(
                color: AppColors.lightGrey.withValues(alpha: 0.4),
                child: Column(
                  children: [
                    CardWidget(
                      iconUrl: AppAssets.kCartIcon,
                      label: "Orders",
                      iconColor: AppColors.skyBlue,
                      onTap: () async {
                        await Future.delayed(Duration(milliseconds: 260)).then(
                          (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrdersScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kFavoriteIcon,
                      label: "Favourite",
                      iconColor: AppColors.purple,
                      onTap: () {},
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kNotificationIcon,
                      label: "Notifications",
                      iconColor: AppColors.vividOrange,
                      onTap: () {},
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kPaymentIcon,
                      label: "Payment Method",
                      iconColor: AppColors.blue,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: ColoredBox(
                color: AppColors.lightGrey.withValues(alpha: 0.4),
                child: Column(
                  children: [
                    CardWidget(
                      iconUrl: AppAssets.kHelpIcon,
                      label: "FAQs",
                      iconColor: AppColors.vibrantRed,
                      onTap: () {},
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kCMDKeyIcon,
                      label: "User Reviews",
                      iconColor: AppColors.blue,
                      onTap: () {},
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kSettingsIcon,
                      label: "Settings",
                      iconColor: AppColors.blue,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: ColoredBox(
                color: AppColors.lightGrey.withValues(alpha: 0.4),
                child: Column(
                  children: [
                    CardWidget(
                      iconUrl: AppAssets.kLogoutIcon,
                      label: "Logout",
                      iconColor: AppColors.vibrantRed,
                      onTap: () {},
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
