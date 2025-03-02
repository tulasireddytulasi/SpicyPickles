import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/model/cart_items_model.dart';
import 'package:spicypickles/presentation/cart/bloc/cart_bloc.dart';
import 'package:spicypickles/presentation/cart/cart.dart';

class CartBottomBar extends StatefulWidget {
  const CartBottomBar({super.key});

  @override
  State<CartBottomBar> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {

  int getTotalQuantity(List<CartItemsModel> cart) {
    return cart.fold(0, (total, item) => total + (item.quantity ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded && state.productList.isNotEmpty) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ),
              );
            },
            child: ColoredBox(
              color: AppColors.amaranth,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  " ${getTotalQuantity(state.productList)} item added",
                  textAlign: TextAlign.center,
                  style: context.textStyle?.titleLarge?.copyWith(color: AppColors.white),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
