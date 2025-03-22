import 'package:flutter/material.dart';

class DashLineDivider extends StatelessWidget {
  const DashLineDivider({
    super.key,
    this.height = 1,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0, // Added dashSpace parameter
    this.color = Colors.black,
  });
  final double height;
  final double dashWidth;
  final double dashSpace; // Parameter to control space between dashes
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashTotalWidth = dashWidth + dashSpace; // Calculate total width of dash + space
        final dashCount = (boxWidth / dashTotalWidth).floor(); // Calculate dash count based on total width

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (index) {
            return SizedBox(
              width: dashTotalWidth, // Use total width for SizedBox
              height: dashHeight,
              child: Row(
                children: [
                  SizedBox(
                    width: dashWidth,
                    height: dashHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: color),
                    ),
                  ),
                  if (index < dashCount - 1) SizedBox(width: dashSpace), // Add space if not the last dash
                ],
              ),
            );
          }),
        );
      },
    );
  }
}