// Purpose: The main screen widget that orchestrates all other components for the seller details page.
// File: seller_details_screen.dart
// Folder: lib/presentation/screens/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/bloc/product_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/seller_bloc/seller_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/category_navigation_bar.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/floating_cart_button.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/seller_hero_section.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/seller_quick_info.dart';
import 'package:spicypickles/app/presentation/widgets/bottom_nav_bar.dart';
import 'dart:math' as math;

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  PagingState<int, String> _state = PagingState();
  static const double expandedHeight = 240.0;
  static const double collapsedHeight = kToolbarHeight;
  static const double leadingIconWidth = 56.0;
  static const double leadingIconPadding = 16.0;
  static const double collapsedTitleLeftPadding = leadingIconWidth + leadingIconPadding;

  // Define the padding for the expanded and collapsed states
  static const EdgeInsets expandedPadding = EdgeInsets.only(top: 52.0, left: 14); // Only the top padding is set here
  static const EdgeInsets collapsedPadding = EdgeInsets.only(left: collapsedTitleLeftPadding);

  // PagingController manages paging logic and state
  late final _pagingController = PagingController<int, String>(
    getNextPageKey: (state) {
      // This convenience getter checks if the last returned page is empty.
      // You can replace this with a check if the last page has returned less items than expected,
      // for a more efficient implementation.
      if (state.lastPageIsEmpty) return null;
      // This convenience getter increments the page key by 1, assuming keys start at 1.
      return state.nextIntPageKey;
    },
    fetchPage: (pageKey) {
      return addData(pageKey);
    }, // Callback to fetch data
  );

  @override
  void initState() {
    super.initState();
    // Dispatch events to load initial data when the screen is created
    context.read<SellerBloc>().add(const LoadSellerDetails());
    context.read<ProductBloc>().add(const LoadProducts());
    context.read<CartBloc>().add(const LoadCart());
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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

                      print("titleFontSize: $titleFontSize");

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
                ),
                SliverAppBar(
                  key: Key("bar2"),
                  toolbarHeight: 30,
                  expandedHeight: 30,
                  floating: false,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(top: 4, bottom: 4),
                    background: Container(
                      decoration: const BoxDecoration(
                        color: AppTheme.whiteColor,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: AppTheme.divider, width: 1.0),
                        ),
                      ),
                      child: const CategoryNavigationBar(),
                    ),
                  ),
                ),
                // PagedSliverList<int, String>.separated(
                //   state: _state,
                //   fetchNextPage: _fetchNextPage, // Called when scroll reaches end
                //   separatorBuilder: (context, index) => const Divider(),
                //   builderDelegate: PagedChildBuilderDelegate(
                //     itemBuilder: (context, item, index) => Container(
                //       margin: const EdgeInsets.only(top: 10),
                //       padding: const EdgeInsets.all(10),
                //       child: Text(item), // Display each item from the list
                //     ),
                //   ),
                // ),
                SliverToBoxAdapter(
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
                          '22 items',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.primaryColor, // text-primary
                            fontSize: 14, // text-sm
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PagingListener(
                  controller: _pagingController,
                  builder: (context, state, fetchNextPage) => PagedSliverList<int, String>.separated(
                    state: state,
                    fetchNextPage: fetchNextPage, // Called when scroll reaches end
                    separatorBuilder: (context, index) => const Divider(),
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) => Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        child: Text(item), // Display each item from the list
                      ),
                    ),
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

  // Simulates fetching data with 2-second delay
  Future<List<String>> addData(int page) async {
    List<String> myList = [];
    //myList.clear();
    if(page >= 4) return [];
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    // Add 5 dummy items per page
    for (int i = 0; i < 5; i++) {
      myList.add('Page $page - Item ${i + 1}');
    }

    return myList; // Return updated list
  }

  void _fetchNextPage() async {
    if (_state.isLoading) return;

    setState(() {
      _state = _state.copyWith(isLoading: true, error: null);
    });

    try {
      final newKey = (_state.keys?.last ?? 0) + 1;
      final newItems = await addData(newKey);
      final isLastPage = newItems.isEmpty;

      setState(() {
        _state = _state.copyWith(
          pages: [...?_state.pages, newItems],
          keys: [...?_state.keys, newKey],
          hasNextPage: !isLastPage,
          isLoading: false,
        );
      });
    } catch (error) {
      setState(() {
        _state = _state.copyWith(
          error: error,
          isLoading: false,
        );
      });
    }
  }
}
