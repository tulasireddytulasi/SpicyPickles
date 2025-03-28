import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/address_screen/address_screen.dart';
import 'package:spicypickles/app/presentation/faqs_screen/faqs_screen.dart';
import 'package:spicypickles/app/presentation/orders_screen/orders_screen.dart';
import 'package:spicypickles/app/presentation/update_profile/update_profile.dart';

import 'widget/card_widget.dart';

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
                      onTap: () {
                         Future.delayed(Duration(milliseconds: 260)).then(
                              (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UpdateProfile(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    CardWidget(
                      iconUrl: AppAssets.kMapIcon,
                      label: "Addresses",
                      iconColor: AppColors.blue,
                      onTap: () {
                        Future.delayed(Duration(milliseconds: 260)).then(
                              (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddressScreen(),
                              ),
                            );
                          },
                        );
                      },
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
                      onTap: () {
                        Future.delayed(Duration(milliseconds: 260)).then(
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
                      onTap: () {
                        Future.delayed(Duration(milliseconds: 260)).then(
                              (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const FaqScreen(),
                              ),
                            );
                          },
                        );
                      },
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
