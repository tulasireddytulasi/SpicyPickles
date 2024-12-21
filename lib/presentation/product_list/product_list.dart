import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/model/products_model.dart';
import 'package:spicypickles/presentation/product_list/widgets/item_card_2.dart';
import 'package:spicypickles/presentation/product_list/widgets/products_list_data.dart';
import 'package:spicypickles/presentation/widgets/text_form_widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final PagingController<int, Product> _pagingController = PagingController(firstPageKey: 1);
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchTextNotifier = ValueNotifier<String>("");


  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _searchTextNotifier.value = _searchController.text;
    });
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
  void dispose() {
    _searchController.dispose();
    _searchTextNotifier.dispose();
    _pagingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormFieldWidget(
              maxWidth: double.infinity,
              controller: _searchController,
              hintText: "Search for your favorite pickle",
              textInputType: TextInputType.text,
              actionKeyboard: TextInputAction.search,
              prefixIcon: const Icon(Icons.arrow_back_ios_rounded, size: 20, color: AppColors.vibrantRed),
              suffixIcon: ValueListenableBuilder<String>(
                valueListenable: _searchTextNotifier,
                builder: (context, value, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (value.isNotEmpty)
                        InkWell(
                          onTap: () {
                            _searchController.clear();
                            _searchTextNotifier.value = "";
                          },
                          child: const Icon(Icons.close, size: 20, color: AppColors.black),
                        ),
                      const SizedBox(width: 6),
                      const RotatedBox(
                        quarterTurns: 3,
                        child: SizedBox(
                          width: 20,
                          child: Divider(
                            height: 4,
                            thickness: 2,
                            color: AppColors.lightGrey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.search_rounded, size: 20, color: AppColors.vibrantRed),
                      const SizedBox(width: 10),
                    ],
                  );
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              maxLength: 100,
              onChanged: (value) {},
              onClick: (value) {
                print("Text: $value");
              },
            ),
          ),
          const Divider(height: 2, thickness: 2, color: AppColors.lightGrey),
          Expanded(
            child: PagedListView<int, Product>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, items, index) => ItemCard2(
                  imgUrl: items.imgUrl ?? "",
                  title: items.title ?? "",
                  description: items.description ?? "",
                  price: items.price ?? "",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
