import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.iconUrl,
    required this.label,
    required this.iconColor, required this.onTap,
  });
  final String iconUrl;
  final String label;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            ClipOval(
              child: ColoredBox(
                color: AppColors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    iconUrl,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: context.textStyle?.headlineSmall?.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontFamily: 'MontserratSemiBold',
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}