import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/theme/app_theme.dart';
import 'package:spicypickles/app/presentation/product_details/widgets/category_navigation_bar.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: Key("bar2"),
      toolbarHeight: 30,
      expandedHeight: 30,
      floating: false,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(top: 4, bottom: 4),
        background: Container(
          decoration: const BoxDecoration(
            color: AppTheme.whiteColor,
            border: Border.symmetric(
              horizontal: BorderSide(color: AppTheme.divider, width: 1.0),
            ),
          ),
          child: const CategoryNavigationBar(),
        ),
      ),
    );
  }
}
