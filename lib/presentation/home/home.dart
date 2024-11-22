import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_constants.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/widgets/text_form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _aadhaarNoController = TextEditingController();

  final List<String> messages = [
    AppConstants.kTagLine,
    AppConstants.kTagLine1,
    AppConstants.kTagLine2,
    "Pickle making is fun and easy!",
    "Time to create your perfect pickle!",
    "Ready to make some mouthwatering pickles?"
  ];

  String currentMessage = AppConstants.kTagLine;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // setTimer();
  }

  setTimer() {
    // Set up the Timer to update text every second
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentMessage = messages[timer.tick % messages.length];
      });
    });
  }

  @override
  void dispose() {
    // Always cancel the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Hi, Tulasi Reddy",
                  style: context.textStyle?.labelLarge?.copyWith(color: AppColors.white.withOpacity(0.8)),
                ),
                const SizedBox(height: 10),
                Text(
                  AppConstants.kTagLine1,
                  style: context.textStyle?.labelLarge?.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  maxWidth: double.infinity,
                  controller: _aadhaarNoController,
                  hintText: "Search for your favorite pickle flavor",
                  textInputType: TextInputType.text,
                  actionKeyboard: TextInputAction.search,
                  maxLength: 100,
                  onChanged: (value) {},
                  onClick: (value) {
                    print("Text: $value");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
