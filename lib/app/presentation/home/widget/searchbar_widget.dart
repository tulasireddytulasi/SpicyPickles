import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/widgets/widget_exports.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget({super.key});

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _searchTextNotifier = ValueNotifier<String>("");

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _searchTextNotifier.value = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchTextNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        color: context.themeData.colorScheme.onPrimary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   "Hi, Tulasi Reddy",
          //   style: context.textStyle?.labelLarge?.copyWith(color: AppColors.black.withOpacity(0.8)),
          // ),
          // const SizedBox(height: 8),
          // Text(
          //   AppConstants.kTagLine1,
          //   style: context.textStyle?.labelLarge?.copyWith(fontSize: 18),
          // ),
          const SizedBox(height: 8),
          TextFormFieldWidget(
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
        ],
      ),
    );
  }
}
