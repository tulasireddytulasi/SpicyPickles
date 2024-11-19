import 'package:flutter/material.dart';
import 'package:spicypickles/features/home/presentation/pages/home.dart';

class SpicyPickleApp extends StatelessWidget {
  const SpicyPickleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
