import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_extensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Product Details Screen", style: context.textStyle?.displayMedium),
    );
  }
}
