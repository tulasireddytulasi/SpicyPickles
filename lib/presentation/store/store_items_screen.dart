import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/model/products_model.dart';
import 'package:spicypickles/presentation/product_list/widgets/products_list_data.dart';
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
      _fetchFoodItems(pageKey: pageKey);
    });
  }

  _fetchFoodItems({required int pageKey}) async {
    try {
      final productsModel = productsModelFromJson(json.encode(RepoData.data2));
      final List<Product> actorsList = productsModel.products ?? [];
      _pagingController.appendPage(actorsList, pageKey + 1);
    } catch (error, stackTrace) {
      log("_fetchFoodItems error: $error");
      log("_fetchFoodItems stackTrace: $stackTrace");
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
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
      body: SafeArea(
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
                    imageUrl: items.imgUrl ?? "",
                    title: items.title ?? "",
                    description: items.description ?? "",
                    price: items.price ?? "",
                    isVeg: false,
                    isBestseller: true,
                    rating: items.rating ?? 0,
                    key: ValueKey(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
