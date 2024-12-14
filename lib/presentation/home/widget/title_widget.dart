import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
  });
  final String title;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: context.colorScheme?.onSecondary.withOpacity(0.4),
                height: 4,
                thickness: 1,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle?.titleMedium?.copyWith(fontSize: 16, color: AppColors.mediumGrey),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Divider(
                color: context.colorScheme?.onSecondary.withOpacity(0.4),
                height: 4,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
