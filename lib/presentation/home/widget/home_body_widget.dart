import 'package:flutter/material.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
