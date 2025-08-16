import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';

class BestsellerTitleWidget extends StatelessWidget {
  const BestsellerTitleWidget({super.key, required this.itemsLength});
  final int itemsLength;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20), // mb-4
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bestsellers',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18, // text-lg
                fontWeight: FontWeight.bold, // font-bold
                color: AppTheme.gray800, // text-gray-800
              ),
            ),
            Text(
              '$itemsLength items',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.primaryColor, // text-primary
                fontSize: 14, // text-sm
              ),
            ),
          ],
        ),
      ),
    );
  }
}
