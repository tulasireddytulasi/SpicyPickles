import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/coupons_screen/coupon_card_widget.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final TextEditingController _couponTextFieldController = TextEditingController();
  final _couponFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lynxWhite,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.colorScheme?.primary,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Coupons Screen",
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _couponFormKey,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightGrey,
                      blurRadius: 6.0,
                      spreadRadius: 0.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: TextFormField(
                  style: const TextStyle(fontSize: 16, color: AppColors.black),
                  controller: _couponTextFieldController,
                  cursorColor: AppColors.black,
                  showCursor: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Enter Code",
                    hintStyle: context.textStyle?.titleLarge?.copyWith(color: context.themeData.primaryColorLight),
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                    errorStyle: const TextStyle(fontSize: 14, color: Colors.deepOrange),
                    counterText: "",
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffix: InkWell(
                      onTap: () {
                        if (_couponFormKey.currentState!.validate()) {
                          log("Valid");
                        } else {
                          log("InValid");
                        }
                      },
                      child: const Text(
                        "APPLY",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            // fontFamily: MONTSERRAT_MEDIUM,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter valid coupon code";
                    } else if (value.trim() == "SPICY") {
                      Navigator.pop(context, true);
                    } else {
                      return "Invalid coupon code";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 20, top: 20, bottom: 10),
              alignment: Alignment.topLeft,
              child: const Text(
                "Available coupons",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontFamily: "MontserratSemiBold",
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return const CouponCard(
                    label: "FLAT OFF",
                    couponCode: "SPICY",
                    shortDescription: "Save ₹80 on this order!",
                    description: "Use code SPICY & get 40% off on orders above ₹159. Maximum discount ₹80.",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
