import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/model/products_model.dart';
import 'package:spicypickles/presentation/home/widget/page_view_widget.dart';
import 'package:spicypickles/presentation/home/widget/pickle_card.dart';
import 'package:spicypickles/presentation/home/widget/searchbar_widget.dart';
import 'package:spicypickles/presentation/product_list/widgets/products_list_data.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  late List<Product> actorsList = [];

  @override
  void initState() {
    super.initState();
    final productsModel = productsModelFromJson(json.encode(RepoData.data2));
    actorsList = productsModel.products ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //const SearchbarWidget(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: const PageViewWithCards(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Explore your favorite pickles",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.headlineMedium?.copyWith(fontSize: 18, color: AppColors.black),
                ),
              ),
              ListView.separated(
                itemCount: actorsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) => PickleCard(
                  imgUrl: actorsList[index].imgUrl ?? AppAssets.kPickle11,
                  title: actorsList[index].title ?? "",
                  description: actorsList[index].description ?? "",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
