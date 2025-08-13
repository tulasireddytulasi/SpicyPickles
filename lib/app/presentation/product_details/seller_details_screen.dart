// Purpose: The main screen widget that orchestrates all other components for the seller details page.
// File: seller_details_screen.dart
// Folder: lib/presentation/screens/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/bloc/product_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/seller_bloc/seller_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/category_navigation_bar.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/custom_app_bar.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/floating_cart_button.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/menu_item_card.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/overall_rating_summary.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/review_card.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/review_highlights.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/seller_hero_section.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/seller_quick_info.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/special_offer_card.dart';
import 'package:spicypickles/app/presentation/widgets/bottom_nav_bar.dart';
import 'dart:math' as math;

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  static const double expandedHeight = 240.0;
  static const double collapsedHeight = kToolbarHeight;
  static const double leadingIconWidth = 56.0;
  static const double leadingIconPadding = 16.0;
  static const double collapsedTitleLeftPadding = leadingIconWidth + leadingIconPadding;

  // Define the padding for the expanded and collapsed states
  static const EdgeInsets expandedPadding = EdgeInsets.only(top: 74.0, left: 14); // Only the top padding is set here
  static const EdgeInsets collapsedPadding = EdgeInsets.only(left: collapsedTitleLeftPadding);

  @override
  void initState() {
    super.initState();
    // Dispatch events to load initial data when the screen is created
    context.read<SellerBloc>().add(const LoadSellerDetails());
    context.read<ProductBloc>().add(const LoadProducts());
    context.read<CartBloc>().add(const LoadCart());
  }

  // Function to open the cart modal (will be implemented later)
  void _openCartModal() {
    // For now, just show a snackbar. The actual modal will be built later.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Opening Cart Modal... (Not implemented yet)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor, // Set background color from theme
      extendBodyBehindAppBar: true, // Allows content to go behind the app bar
      body: MultiBlocListener(
        listeners: [
          BlocListener<SellerBloc, SellerState>(
            listener: (context, state) {
              if (state is SellerError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is ProductError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is CartError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: expandedHeight,
                  collapsedHeight: collapsedHeight,
                  pinned: true,
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      final double currentHeight = constraints.biggest.height;
                      final double scrollProgress =
                          math.max(0.0, 1.0 - (currentHeight - collapsedHeight) / (expandedHeight - collapsedHeight));

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

                      return FlexibleSpaceBar(
                        titlePadding: EdgeInsets.only(top: 6, bottom: 4),
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
                                          fontSize: 16, // text-2xl
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
                      );
                    },
                  ),
                ),
                SliverAppBar(
                  key: Key("bar3"),
                  toolbarHeight: 30,
                  expandedHeight: 30,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: Colors.blue,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(top: 4, bottom: 4),
                    background: Container(
                        decoration: const BoxDecoration(
                          color: AppTheme.whiteColor,
                          border: Border.symmetric(horizontal: BorderSide(color: AppTheme.gray100, width: 2.0)),
                        ),
                        child: const CategoryNavigationBar()),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // Menu Section (Bestsellers)
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductLoaded) {
                            // Only show bestsellers if 'all' or 'bestsellers' category is active
                            if (state.activeCategory == 'all' || state.activeCategory == 'bestsellers') {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // px-4 py-4
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16.0), // mb-4
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
                                            '${state.bestsellers.length} items',
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  color: AppTheme.primaryColor, // text-primary
                                                  fontSize: 14, // text-sm
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // List of Menu Items
                                    Column(
                                      children: state.bestsellers.map((product) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 16.0), // space-y-4 (for each card)
                                          child: MenuItemCard(product: product),
                                          // child: Text('Failed to load products: ${product.name}'),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const SizedBox.shrink(); // Hide if not in active category
                            }
                          } else if (state is ProductLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is ProductError) {
                            return Center(child: Text('Failed to load products: ${state.message}'));
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      // Special Offers Section
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductLoaded && state.specialOffers.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0), // mb-3
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Special Offers',
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                fontSize: 16, // text-base
                                                fontWeight: FontWeight.w600, // font-semibold
                                                color: AppTheme.gray800,
                                              ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                  content: Text('View All Special Offers (Not implemented)')),
                                            );
                                          },
                                          child: Text(
                                            'View All',
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  color: AppTheme.primaryColor,
                                                  fontSize: 14, // text-sm
                                                  fontWeight: FontWeight.w500, // font-medium
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Display the first special offer card
                                  SpecialOfferCard(offer: state.specialOffers.first),
                                ],
                              ),
                            );
                          } else if (state is ProductLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is ProductError) {
                            return Center(child: Text('Failed to load special offers: ${state.message}'));
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      // Customer Reviews Section
                      BlocBuilder<SellerBloc, SellerState>(
                        builder: (context, state) {
                          if (state is SellerLoaded) {
                            // Mock review highlights for now (as SellerDetailsModel doesn't contain them)
                            final List<String> mockReviewHighlights = [
                              'Authentic taste (45)',
                              'Great quality (38)',
                              'Fresh ingredients (32)',
                              'Perfect spice level (28)',
                            ];

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0), // mb-6
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // mb-3
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Customer Reviews',
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                fontSize: 16, // text-base
                                                fontWeight: FontWeight.w600, // font-semibold
                                                color: AppTheme.gray800,
                                              ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('See All Reviews (Not implemented)')),
                                            );
                                          },
                                          child: Text(
                                            'See All',
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  color: AppTheme.primaryColor,
                                                  fontSize: 14, // text-sm
                                                  fontWeight: FontWeight.w500, // font-medium
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OverallRatingSummary(sellerDetails: state.sellerDetails),
                                  ReviewHighlights(highlights: mockReviewHighlights),
                                  // Recent Reviews Section
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0), // mb-2
                                          child: Text(
                                            'Recent Reviews',
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontSize: 14, // text-sm
                                                  fontWeight: FontWeight.w500, // font-medium
                                                  color: AppTheme.gray800, // text-gray-700
                                                ),
                                          ),
                                        ),
                                        // List of Review Cards
                                        ...state.recentReviews.asMap().entries.map((entry) {
                                          final int index = entry.key;
                                          final review = entry.value;
                                          final bool isLast = index == state.recentReviews.length - 1;
                                          return ReviewCard(review: review, isLastItem: isLast);
                                        }).toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (state is SellerLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is SellerError) {
                            return Center(child: Text('Failed to load reviews: ${state.message}'));
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      // Placeholder for About Section
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        color: AppTheme.whiteColor,
                        child: Text(
                          'About Section Placeholder',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(height: 100), // Space for bottom nav and floating button
                    ],
                  ),
                ),
              ],
            ),
            // Bottom Navigation Bar
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(),
            ),
            // Floating Cart Button
            FloatingCartButton(onPressed: _openCartModal),
          ],
        ),
      ),
    );
  }
}
