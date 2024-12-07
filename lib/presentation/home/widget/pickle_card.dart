import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class PickleCard extends StatelessWidget {
  const PickleCard({super.key, required this.imgUrl, required this.description,});

  final String imgUrl;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: (){},
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 500,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "$description $description",
              maxLines: 2 ,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle?.bodySmall?.copyWith(
                fontSize: 12,
                color: AppColors.charcoal,
                fontFamily: "MontserratSemiBold",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
