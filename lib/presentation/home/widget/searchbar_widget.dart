import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/widgets/text_form_widget.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget({super.key});

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  final TextEditingController _aadhaarNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Hi, Tulasi Reddy",
            style: context.textStyle?.labelLarge?.copyWith(color: AppColors.white.withOpacity(0.8)),
          ),
          // const SizedBox(height: 8),
          // Text(
          //   AppConstants.kTagLine1,
          //   style: context.textStyle?.labelLarge?.copyWith(fontSize: 18),
          // ),
          const SizedBox(height: 8),
          TextFormFieldWidget(
            maxWidth: double.infinity,
            controller: _aadhaarNoController,
            hintText: "Search for your favorite pickle",
            textInputType: TextInputType.text,
            actionKeyboard: TextInputAction.search,
            suffixIcon: const Icon(Icons.search_rounded, size: 32, color: AppColors.vibrantRed),
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
