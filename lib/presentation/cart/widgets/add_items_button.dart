import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({super.key, this.width = 100, this.height = 40, this.noOfItems = 0});

  final double width;
  final double height;
  final int noOfItems;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  late int noOfItems4;
  late final ValueNotifier<int> noOfItems;

  @override
  void initState() {
    super.initState();
    noOfItems = ValueNotifier<int>(widget.noOfItems);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: noOfItems,
      builder: (context, value, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: noOfItems.value > 0 ? AppColors.amaranth : AppColors.lavenderBlush,
            border: Border.all(color: AppColors.vibrantRed, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: noOfItems.value > 0
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => noOfItems.value -= 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "−",
                            style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      noOfItems.value.toString(),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => noOfItems.value += 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "+",
                            style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : InkWell(
                  onTap: () => noOfItems.value += 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "ADD",
                      style: context.textStyle?.labelLarge?.copyWith(
                        color: AppColors.vibrantRed,
                        fontFamily: 'MontserratBold',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
