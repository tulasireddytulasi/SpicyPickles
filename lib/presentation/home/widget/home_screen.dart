import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_assets.dart';
import 'package:spicypickles/model/icons_model.dart';
import 'package:spicypickles/model/products_model.dart';
import 'package:spicypickles/presentation/home/widget/page_view_widget.dart';
import 'package:spicypickles/presentation/home/widget/pickle_card.dart';
import 'package:spicypickles/presentation/home/widget/pickles_list.dart';
import 'package:spicypickles/presentation/home/widget/title_widget.dart';
import 'package:spicypickles/presentation/product_list/widgets/products_list_data.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  late List<Product> productsList = [];
  late PickleIconsModel pickleIconsModel;

  @override
  void initState() {
    super.initState();
    final productsModel = productsModelFromJson(json.encode(RepoData.data2));
    productsList = productsModel.products ?? [];
    pickleIconsModel = pickleIconsModelFromJson(json.encode(RepoData.iconsData));
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
              const TitleWidget(title: "WHAT'S ON YOUR MIND ?", verticalPadding: 20),
              PicklesList(iconsModel: pickleIconsModel),
              const TitleWidget(title: "EXPLORE", verticalPadding: 20),
              ListView.separated(
                itemCount: productsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) => PickleCard(
                  imgUrl: productsList[index].imgUrl ?? AppAssets.kPickle11,
                  title: productsList[index].title ?? "",
                  description: productsList[index].description ?? "",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
