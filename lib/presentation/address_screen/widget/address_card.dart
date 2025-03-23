import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/widgets/circular_icon.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.context,
    required this.title,
    required this.address,
    required this.distance,
    required this.phoneNumber,
  });

  final BuildContext context;
  final String title;
  final String address;
  final String distance;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: AppColors.lightGrey),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.home, color: AppColors.grey), // Assuming home icon for all
                    SizedBox(width: 8),
                    Text(
                      title,
                      style: context.textStyle?.titleLarge,
                    ),
                    Spacer(),
                    Text(distance),
                  ],
                ),
                SizedBox(height: 8),
                Text(address,
                    style: context.textStyle?.titleMedium?.copyWith(
                      color: AppColors.black,
                    )),
                SizedBox(height: 8),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Phone number: ",
                    style: context.textStyle?.titleSmall?.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  TextSpan(
                    text: phoneNumber,
                    style: context.textStyle?.titleSmall?.copyWith(
                      color: AppColors.black,
                      fontFamily: "MontserratSemiBold",
                    ),
                  ),
                ])),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularIcon(
                      icon: Icons.more_horiz_rounded,
                      width: 30,
                      iconSize: 16,
                      onPressed: () {},
                    ),
                    SizedBox(width: 8),
                    CircularIcon(
                      icon: Icons.share_rounded,
                      iconSize: 12,
                      width: 30,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
