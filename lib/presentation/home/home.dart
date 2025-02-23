import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/core/utils/app_constants.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';
import 'package:spicypickles/presentation/home/widget/app_bar.dart';
import 'package:spicypickles/presentation/home/widget/home_screen.dart';
import 'package:spicypickles/presentation/product_details/product_details.dart';
import 'package:spicypickles/presentation/product_list/product_list.dart';
import 'package:spicypickles/presentation/product_list/widgets/explore_app_bar.dart';
import 'package:spicypickles/presentation/profile/profile.dart';
import 'package:spicypickles/presentation/profile/widget/profile_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeBodyWidget(),
    ProductListScreen(),
    ProfileScreen(),
    ProductDetailsScreen(),
  ];

  final List<PreferredSizeWidget> _appBars = const [
    HomeAppBar(),
    HomeAppBar(),
    ProfileAppBar(),
  ];

  final List<String> messages = [
    AppConstants.kTagLine,
    AppConstants.kTagLine1,
    AppConstants.kTagLine2,
    "Pickle making is fun and easy!",
    "Time to create your perfect pickle!",
    "Ready to make some mouthwatering pickles?"
  ];

  String currentMessage = AppConstants.kTagLine;
  // late Timer _timer;

  @override
  void initState() {
    super.initState();
    // setTimer();
  }

  // setTimer() {
  //   // Set up the Timer to update text every second
  //   _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
  //     setState(() {
  //       currentMessage = messages[timer.tick % messages.length];
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   // Always cancel the timer to prevent memory leaks
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme?.onPrimary,
      appBar: _appBars[_currentIndex],
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white, // Background color for NavigationBar
        surfaceTintColor: Colors.white, // Keeps the surface color stable
        shadowColor: Colors.black, // Shadow color for elevation
        elevation: 10, // Simulates elevation effect
        indicatorColor: context.themeData.primaryColor,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: AppColors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fastfood_outlined),
            selectedIcon: Icon(Icons.fastfood_rounded, color: AppColors.white),
            label: 'Pickles',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person, color: AppColors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
