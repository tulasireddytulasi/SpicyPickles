import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/cart/widgets/cart_items_widget.dart';

class CardItemsWidget extends StatefulWidget {
  const CardItemsWidget({super.key});

  @override
  State<CardItemsWidget> createState() => _CardItemsWidgetState();
}

class _CardItemsWidgetState extends State<CardItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        //  border: Border.all(color: black, width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: const BoxDecoration(
                  color: AppColors.vibrantRed,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "Your Orders",
                style: TextStyle(
                    color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const Divider(
              height: 2,
              thickness: 1,
              color: AppColors.lightGrey,
            ),
            itemBuilder: (context, index) {
              return const Items();
            },
          ),
        ],
      ),
    );
  }
}
