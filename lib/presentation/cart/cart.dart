import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/cart/widgets/billing_details_widget.dart';
import 'package:spicypickles/presentation/cart/widgets/cancellation_details_widget.dart';
import 'package:spicypickles/presentation/cart/widgets/cart_items_list_widget.dart';
import 'package:spicypickles/presentation/cart/widgets/coupons_widget.dart';
import 'package:spicypickles/presentation/cart/widgets/delivery_address_card.dart';
import 'package:spicypickles/presentation/cart/widgets/delivery_time_widget.dart';
import 'package:spicypickles/presentation/cart/widgets/free_delivery_card_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lynxWhite,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.colorScheme?.primary,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: const Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    FreeDeliveryCard(),
                    SizedBox(height: 16),
                    Delivery(),
                    SizedBox(height: 16),
                    CouponsWidget(),
                    SizedBox(height: 16),
                    CardItemsWidget(),
                    SizedBox(height: 16),
                    BillingDetailsWidget(),
                    SizedBox(height: 16),
                    Delivery(),
                    SizedBox(height: 16),
                    CancellationInfoWidget(),
                    SizedBox(height: 200),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DeliveryAddressCard(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
