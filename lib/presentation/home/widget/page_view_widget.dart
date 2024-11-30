import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_constants.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class PageViewWithCards extends StatefulWidget {
  const PageViewWithCards({super.key});

  @override
  State<PageViewWithCards> createState() => _PageViewWithCardsState();
}

class _PageViewWithCardsState extends State<PageViewWithCards> {
  final PageController pageController = PageController(viewportFraction: 0.92, initialPage: 0, keepPage: false);
  final List<String> images = [
    AppAssets.kPic2,
    AppAssets.kPic3,
    AppAssets.kPic4,
    AppAssets.kPic5,
    AppAssets.kPic6,
    AppAssets.kPic1,
  ];

  final List<String> labels = [
    AppConstants.kDiscoverMagic,
    AppConstants.kFarmToJar,
    AppConstants.kFavoritePickles,
    AppConstants.kFlavorExplosion,
    AppConstants.kFreshIngredients,
    AppConstants.kLoveInEveryJar,
    AppConstants.kPickleLover,
    AppConstants.kPickleYourWay,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      padEnds: false,
      controller: pageController,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          color: AppColors.blush,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 190,
                  child: Text(
                    labels[index],
                    maxLines: 3,
                    softWrap: true,
                    style: context.textStyle?.headlineMedium?.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.deepRed,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: 110,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Order Now",
                        maxLines: 3,
                        softWrap: true,
                        style: context.textStyle?.headlineMedium?.copyWith(fontSize: 12, color: AppColors.white),
                      ),
                      const SizedBox(width: 2),
                      Image.asset(
                        AppAssets.kChilliIcon,
                        fit: BoxFit.cover,
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                top: 0,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
