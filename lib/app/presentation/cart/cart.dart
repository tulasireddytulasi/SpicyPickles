import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

import 'widgets/cart_widgets_export.dart';

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
