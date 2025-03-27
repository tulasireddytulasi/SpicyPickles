import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';
import 'package:spicypickles/app/presentation/cart/widgets/cart_widgets_export.dart';

class CardItemsWidget extends StatefulWidget {
  const CardItemsWidget({super.key});

  @override
  State<CardItemsWidget> createState() => _CardItemsWidgetState();
}

class _CardItemsWidgetState extends State<CardItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded && state.productList.isNotEmpty) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
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
                      style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.productList.length,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => const Divider(
                    height: 2,
                    thickness: 1,
                    color: AppColors.lightGrey,
                  ),
                  itemBuilder: (context, index) {
                    return Items(product: state.productList[index].product!);
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text(
              "No items",
              style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }
}
