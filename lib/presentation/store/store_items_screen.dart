import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/model/products_model.dart';
import 'package:spicypickles/presentation/store/bloc/store_items_bloc.dart';
import 'package:spicypickles/presentation/store/widget/product_card.dart';

class StoreItemsScreen extends StatefulWidget {
  const StoreItemsScreen({super.key});

  @override
  State<StoreItemsScreen> createState() => _StoreItemsScreenState();
}

class _StoreItemsScreenState extends State<StoreItemsScreen> {
  final PagingController<int, Product> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      context.read<StoreItemsBloc>().add(FetchFoodItemsEvent(pageKey: pageKey));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    context.read<StoreItemsBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Just Eat & Go",
          style: context.textStyle?.bodySmall?.copyWith(
            fontSize: 14,
            color: AppColors.black,
            fontFamily: "MontserratSemiBold",
          ),
        ),
      ),
      backgroundColor: context.colorScheme?.onPrimary,
      body: BlocConsumer<StoreItemsBloc, StoreItemsState>(
        listener: (context, state) {
          if (state is StoreItemsLoaded) {
            _pagingController.appendPage(state.products, state.nextPageKey + 1);
          } else if (state is StoreItemsError) {
            _pagingController.error = state.message;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Just Eat & Go",
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle?.bodySmall?.copyWith(
                      fontSize: 22,
                      color: AppColors.black,
                      fontFamily: "MontserratBold",
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(height: 2, thickness: 4, color: AppColors.lynxWhite),
                ),
                Expanded(
                  child: PagedListView<int, Product>.separated(
                    pagingController: _pagingController,
                    separatorBuilder: (BuildContext context, int index) => const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        color: AppColors.lynxWhite,
                      ),
                    ),
                    builderDelegate: PagedChildBuilderDelegate<Product>(
                      itemBuilder: (context, items, index) => FoodItemCard(
                        product: items,
                        key: ValueKey(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
