import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/model/products_model.dart';
import 'package:spicypickles/presentation/product_list/widgets/item_card.dart';
import 'package:spicypickles/presentation/product_list/widgets/products_list_data.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final PagingController<int, Product> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPopularActors(pageKey: pageKey);
    });
  }

  _fetchPopularActors({required int pageKey}) async {
    try {
      final productsModel = productsModelFromJson(json.encode(RepoData.data));
      final List<Product> actorsList = productsModel.products ?? [];
      _pagingController.appendPage(actorsList, pageKey + 1);
    } catch (error, stackTrace) {
      log("fetchPopularActors error: $error");
      log("fetchPopularActors stackTrace: $stackTrace");
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PagedGridView<int, Product>(
            showNewPageProgressIndicatorAsGridChild: false,
            showNewPageErrorIndicatorAsGridChild: false,
            showNoMoreItemsIndicatorAsGridChild: false,
            pagingController: _pagingController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 5/7,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
            ),
            builderDelegate: PagedChildBuilderDelegate<Product>(
              itemBuilder: (context, items, index) => ItemCard(
                imgUrl: items.imgUrl ?? "",
                title: items.title ?? "",
                description: items.description ?? "",
                price: items.price ?? "",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
