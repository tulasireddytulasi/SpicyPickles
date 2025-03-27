import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/home/home.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    moveToOrders();
  }

  moveToOrders() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.kSuccessTickAnim,
              repeat: false,
              height: 300,
              width: 300,
              animate: true,
            ),
            Text(
              "Yay! Order Received",
              textAlign: TextAlign.center,
              style: context.textStyle?.headlineLarge?.copyWith(fontSize: 24, color: AppColors.black),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "8-4, Khairathabad, Hyderabad, Telangana - 560025",
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle?.titleLarge, //?.copyWith(fontSize: 16, color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
