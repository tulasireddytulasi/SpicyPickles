import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/home/widget/home_widget_exports.dart';
import 'package:spicypickles/app/presentation/product_details/product_details.dart';
import 'package:spicypickles/app/presentation/product_list/product_list.dart';
import 'package:spicypickles/app/presentation/profile/profile.dart';
import 'package:spicypickles/app/presentation/profile/widget/profile_app_bar.dart';

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
