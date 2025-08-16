import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:spicypickles/app/presentation/dashboard_screen/widgets/app_bar.dart';
import 'package:spicypickles/app/presentation/home/widget/home_widget_exports.dart';
import 'package:spicypickles/app/presentation/product_list/product_list.dart';
import 'package:spicypickles/app/presentation/profile/profile.dart';
import 'package:spicypickles/app/presentation/profile/widget/profile_app_bar.dart';
import 'package:spicypickles/app/presentation/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    ProductListScreen(),
    ProductListScreen(),
    ProfileScreen(),
  ];

  final List<PreferredSizeWidget> _appBars = const [
    CustomAppBar(),
    HomeAppBar(),
    HomeAppBar(),
    ProfileAppBar(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme?.onPrimary,
      appBar: _appBars[_currentIndex],
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavBar(
        onPageChanged: (int pageNo){
          setState(() {
            _currentIndex = pageNo;
          });
        },
      ),
    );
  }
}
