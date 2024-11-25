import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/home/widget/horizontal_item_card.dart';
import 'package:spicypickles/presentation/home/widget/page_view_widget.dart';
import 'package:spicypickles/presentation/home/widget/searchbar_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
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
              const SearchbarWidget(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: const PageViewWithCards(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Best Chilli Pickles",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle?.headlineMedium?.copyWith(fontSize: 18, color: AppColors.black),
                ),
              ),
              ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const HorizontalItemCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
