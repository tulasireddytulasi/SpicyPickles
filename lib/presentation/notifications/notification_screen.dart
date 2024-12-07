import 'package:flutter/material.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/widgets/circular_icon_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
        leading: CircularIconWidget(
          icon: Icons.arrow_back_ios_rounded,
          padding: const EdgeInsets.all(8.0),
          onTap: () => Navigator.pop(context),
          size: 22,
        ),
      ),
    );
  }
}
