import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/presentation/product_details/seller_bloc/seller_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/seller_hero_section.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/seller_quick_info.dart';

class SellerAppbar extends StatefulWidget {
  const SellerAppbar({super.key});

  @override
  State<SellerAppbar> createState() => _SellerAppbarState();
}

class _SellerAppbarState extends State<SellerAppbar> {
  static const double expandedHeight = 250.0;
  static const double collapsedHeight = kToolbarHeight;
  static const double leadingIconWidth = 56.0;
  static const double leadingIconPadding = 16.0;
  static const double collapsedTitleLeftPadding = leadingIconWidth + leadingIconPadding;

  // Define the padding for the expanded and collapsed states
  static const EdgeInsets expandedPadding = EdgeInsets.only(top: 52.0, left: 14); // Only the top padding is set here
  static const EdgeInsets collapsedPadding = EdgeInsets.only(left: collapsedTitleLeftPadding);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: Key("bar1"),
      floating: false,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      backgroundColor: Colors.white,
      pinned: true,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      actions: [
        const Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.more_vert, color: Colors.black),
        )
      ],
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double currentHeight = constraints.biggest.height;
          final double scrollProgress =
          math.max(0.0, 1.0 - (currentHeight - collapsedHeight) / (expandedHeight - collapsedHeight));

          // Calculate the font size based on scroll progress
          final double titleFontSize = 16.0 - (16.0 - 18.0) * scrollProgress;

          final Alignment titleAlignment = Alignment.lerp(
            Alignment.centerLeft,
            Alignment.centerLeft,
            scrollProgress,
          )!;

          // **FIXED:** The `EdgeInsets.lerp` now correctly transitions from `expandedPadding`
          // to `collapsedPadding`. Changes to `expandedPadding` will no longer
          // affect the final `collapsedPadding`.
          final EdgeInsets titlePadding = EdgeInsets.lerp(
            expandedPadding,
            collapsedPadding,
            scrollProgress,
          )!;

          return ColoredBox(
            color: Colors.white,
            child: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(top: 28, bottom: 4),
              centerTitle: true,
              background: BlocBuilder<SellerBloc, SellerState>(
                builder: (context, state) {
                  if (state is SellerLoaded) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FeaturedWidget(sellerDetails: state.sellerDetails),
                        OverallRatingWidget(sellerDetails: state.sellerDetails),
                        SellerQuickInfo(sellerDetails: state.sellerDetails),
                      ],
                    );
                  } else if (state is SellerLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SellerError) {
                    return Center(child: Text('Failed to load seller details: ${state.message}'));
                  }
                  return const SizedBox.shrink(); // Initial or other states
                },
              ),
              title: Align(
                alignment: titleAlignment,
                child: Padding(
                  padding: titlePadding,
                  child: BlocBuilder<SellerBloc, SellerState>(
                    builder: (context, state) {
                      if (state is SellerLoaded) {
                        return Text(
                          state.sellerDetails.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: titleFontSize, // text-2xl
                            fontWeight: FontWeight.bold, // font-bold
                            color: AppTheme.gray800, // text-gray-800
                          ),
                        );
                      } else if (state is SellerError) {
                        return Center(child: Text('Failed to load seller details: ${state.message}'));
                      }
                      return const SizedBox.shrink(); // Initial or other states
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
