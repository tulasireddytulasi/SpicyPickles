import 'package:flutter/material.dart';
import 'package:spicypickles/core/theme/light_theme.dart';
import 'package:spicypickles/presentation/home/home.dart';

class SpicyPickleApp extends StatelessWidget {
  const SpicyPickleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().themeData,
      home: const HomeScreen(),
    );
  }
}
