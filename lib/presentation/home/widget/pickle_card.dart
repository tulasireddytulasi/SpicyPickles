import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class PickleCard extends StatelessWidget {
  const PickleCard({
    super.key,
    required this.imgUrl,
    required this.description,
  });

  final String imgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Material(
        color: Colors.transparent, // Ensures the background color doesn't override the design
        borderRadius: const BorderRadius.all(Radius.circular(10)), // Matches the container's border radius
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)), // Ensures ripple effect matches the shape
          onTap: () {
            // Handle click event here
            debugPrint("Container clicked!");
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "$description $description",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.bodySmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.charcoal,
                    fontFamily: "MontserratSemiBold",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
