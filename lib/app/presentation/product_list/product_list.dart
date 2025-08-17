import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/data/models/model_exports.dart';
import 'package:spicypickles/app/presentation/product_details/seller_details_screen.dart';
import 'package:spicypickles/app/presentation/product_list/widgets/product_list_widget_exports.dart';
import 'package:spicypickles/app/presentation/widgets/widget_exports.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late FocusNode _myFocusNode;
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchTextNotifier = ValueNotifier<String>("");

  // PagingController manages paging logic and state
  late final _pagingController = PagingController<int, Product>(
    getNextPageKey: (state) {
      // This convenience getter checks if the last returned page is empty.
      // You can replace this with a check if the last page has returned less items than expected,
      // for a more efficient implementation.
      if (state.lastPageIsEmpty) return null;
      // This convenience getter increments the page key by 1, assuming keys start at 1.
      return state.nextIntPageKey;
    },
    fetchPage: (pageKey) {
      return _fetchItems(pageKey: pageKey);
    }, // Callback to fetch data
  );


  @override
  void initState() {
    super.initState();
    _myFocusNode = FocusNode();
    _searchController.addListener(() {
      _searchTextNotifier.value = _searchController.text;
    });
  }

  Future<List<Product>> _fetchItems({required int pageKey}) async {
    try {
      final productsModel = productsModelFromJson(json.encode(RepoData.data2));
      final List<Product> productsList = productsModel.products ?? [];
      return productsList;
    } catch (error, stackTrace) {
      log("fetchPopularActors error: $error");
      log("fetchPopularActors stackTrace: $stackTrace");
      return [];
    }
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    _searchController.dispose();
    _searchTextNotifier.dispose();
   _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => _myFocusNode.unfocus(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(
                focusNode: _myFocusNode,
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
              child: PagingListener(
                controller: _pagingController,
                builder: (context, state, fetchNextPage) => PagedListView<int, Product>.separated(
                  state: state,
                  fetchNextPage: fetchNextPage, // Called when scroll reaches end
                  separatorBuilder: (context, index) => const Divider(),
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, items, index) => ItemCard2(
                      imgUrl: items.imgUrl ?? "",
                      title: items.title ?? "",
                      description: items.description ?? "",
                      price: items.price ?? 0.0,
                      onTap: () async {
                        _myFocusNode.unfocus();
                        await Future.delayed(const Duration(milliseconds: 200));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SellerDetailsScreen(),
                          ),
                        );
                      },
                    ),
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
