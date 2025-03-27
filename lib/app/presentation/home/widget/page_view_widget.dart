import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class PageViewWithCards extends StatefulWidget {
  const PageViewWithCards({super.key});

  @override
  State<PageViewWithCards> createState() => _PageViewWithCardsState();
}

class _PageViewWithCardsState extends State<PageViewWithCards> {
  final PageController pageController = PageController(viewportFraction: 0.92, initialPage: 0, keepPage: false);
  final List<String> images = [
    AppAssets.kBanner4,
    AppAssets.kBanner1,
    AppAssets.kBanner3,
    AppAssets.kBanner5,
    AppAssets.kBanner2,
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: images[index],
              height: 190,
              width: double.infinity,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}