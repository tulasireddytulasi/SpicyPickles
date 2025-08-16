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
import 'package:spicypickles/app/presentation/product_details/widgets/category_widget.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/floating_cart_button.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/sliver_app_bar.dart';
import 'package:spicypickles/app/presentation/widgets/bottom_nav_bar.dart';

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  PagingState<int, String> _state = PagingState();

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
                SellerAppbar(),
                CategoryWidget(),
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
