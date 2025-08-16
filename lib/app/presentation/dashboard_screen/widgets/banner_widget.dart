import 'package:flutter/material.dart';
import 'package:spicypickles/app/data/mock_data/banner_mock_data.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customBorderRadius = Theme.of(context).customBorderRadius; 
    //Theme.of(context).extension<CustomBorderRadius>();

    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: customBorderRadius.defaultRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: mockBanners.length,
            itemBuilder: (context, index) {
              final banner = mockBanners[index];
              return ClipRRect(
                borderRadius: customBorderRadius.defaultRadius,
                child: Stack(
                  children: [
                    Image.network(
                      banner.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.accentColor,
                                borderRadius: customBorderRadius.full,
                              ),
                              child: Text(
                                banner.tag,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppTheme.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              banner.title,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppTheme.whiteColor,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${banner.description} • Ends in ${banner.duration}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(mockBanners.length, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? AppTheme.secondaryColor : AppTheme.whiteColor.withValues(alpha: 0.6),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}