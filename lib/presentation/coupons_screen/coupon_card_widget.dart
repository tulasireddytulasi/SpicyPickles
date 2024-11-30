import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/widgets/dash_line_divider_widget.dart';

class CouponCard extends StatefulWidget {
  const CouponCard({
    super.key,
    required this.label,
    required this.couponCode,
    required this.description,
    required this.shortDescription,
  });

  final String label;
  final String couponCode;
  final String description;
  final String shortDescription;

  @override
  State<CouponCard> createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 180,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightGrey,
            blurRadius: 6.0,
            spreadRadius: 0.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            decoration: BoxDecoration(
              color: context.themeData.secondaryHeaderColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                widget.label,
                style: context.textStyle?.titleMedium?.copyWith(color: AppColors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      widget.couponCode,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyle?.titleLarge?.copyWith(color: AppColors.black),
                    ),
                  ),
                  SizedBox(width: screenWidth / 2.6),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      child: Text(
                        "APPLY",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle?.titleLarge?.copyWith(color: context.themeData.secondaryHeaderColor),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.shortDescription,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle?.titleMedium?.copyWith(color: AppColors.darkGreen),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: screenWidth / 1.5,
                child: const DashLineDivider(color: Colors.grey, dashWidth: 4.0),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: screenWidth / 1.5,
                child: Text(
                  widget.description,
                  softWrap: true,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.bodyMedium,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: screenWidth / 1.5,
                child: Text(
                  "+ MORE",
                  style: context.textStyle?.titleMedium?.copyWith(color: AppColors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
