import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/model/model_exports.dart';
import 'package:spicypickles/app/presentation/cart/bloc/cart_bloc.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({
    super.key,
    this.width = 100,
    this.height = 40,
    this.noOfItems = 0,
    required this.product,
  });

  final double width;
  final double height;
  final int noOfItems;
  final Product product;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  late int noOfItems;

  @override
  void initState() {
    super.initState();
    noOfItems = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          // Find the product in the cart
          CartItemsModel? cartItemsModel = state.productList.firstWhere(
            (item) => item.product?.title == widget.product.title,
            orElse: () => CartItemsModel(product: null, quantity: 0), // Return default CartItemsModel
          );
          noOfItems = cartItemsModel.quantity ?? 0;
        }

        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: noOfItems > 0 ? AppColors.amaranth : AppColors.lavenderBlush,
            border: Border.all(color: AppColors.vibrantRed, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: noOfItems > 0
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<CartBloc>().add(RemoveItem(product: widget.product));
                        },
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
                      noOfItems.toString(),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<CartBloc>().add(AddItem(product: widget.product));
                        },
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
                  onTap: () {
                    context.read<CartBloc>().add(AddItem(product: widget.product));
                  },
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
