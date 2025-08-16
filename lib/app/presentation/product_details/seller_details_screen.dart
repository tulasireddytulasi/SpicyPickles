// Purpose: The main screen widget that orchestrates all other components for the seller details page.
// File: seller_details_screen.dart
// Folder: lib/presentation/screens/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/model/products_model.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/bloc/product_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/seller_bloc/seller_bloc.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/bestseller_title_widget.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/category_widget.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/floating_cart_button.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/sliver_app_bar.dart';
import 'package:spicypickles/app/presentation/store/bloc/store_items_bloc.dart';
import 'package:spicypickles/app/presentation/widgets/bottom_nav_bar.dart';

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch events to load initial data when the screen is created
    context.read<SellerBloc>().add(const LoadSellerDetails());
    context.read<ProductBloc>().add(const LoadProducts());
    context.read<CartBloc>().add(const LoadCart());
    _fetchPagingStateEvent();
  }

  void _fetchPagingStateEvent() {
    context.read<StoreItemsBloc>().add(const FetchPagingStateEvent());
  }

  @override
  void dispose() {
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
                BestsellerTitleWidget(itemsLength: 22),
                BlocBuilder<StoreItemsBloc, StoreItemsState>(
                  buildWhen: (previous, current) => (current is FetchItemsState),
                  builder: (context, state) {
                    if (state is FetchItemsState) {
                      return PagedSliverList<int, Product>.separated(
                        state: state.pagingState,
                        fetchNextPage: _fetchPagingStateEvent, // Called when scroll reaches end
                        separatorBuilder: (context, index) => const Divider(),
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder: (context, item, index) => Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            child: Text(item.title ?? "No data"), // Display each item from the list
                          ),
                        ),
                      );
                    } else {
                      return SliverToBoxAdapter(child: Center(child: Text("Loading Food Items")));
                    }
                  },
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
