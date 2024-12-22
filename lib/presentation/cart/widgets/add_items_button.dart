import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({super.key, this.width = 100, this.height = 40, this.noOfItems = 0});

  final double width;
  final double height;
  final int noOfItems;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  late int noOfItems;

  @override
  void initState() {
    super.initState();
    noOfItems = widget.noOfItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.lightPeach,
        border: Border.all(color: AppColors.vibrantRed, width: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: noOfItems > 0
          ? Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        noOfItems -= 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "−",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Text(
                  noOfItems.toString(),
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        noOfItems += 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "+",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : InkWell(
              onTap: () {
                setState(() {
                  noOfItems += 1;
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "ADD",
                  style: TextStyle(
                    color: AppColors.vibrantRed,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
  }
}
