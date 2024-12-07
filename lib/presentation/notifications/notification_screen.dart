import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spicypickles/core/utils/app_colors.dart';
import 'package:spicypickles/presentation/notifications/dummy_data.dart';
import 'package:spicypickles/presentation/notifications/widget/notification_card.dart';
import 'package:spicypickles/presentation/widgets/circular_icon_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Map<String, List<Map<String, dynamic>>> groupedNotifications = {};

  @override
  void initState() {
    super.initState();
    groupedNotifications = groupNotificationsByDate();
  }

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
      body: ListView(
        children: groupedNotifications.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  entry.key, // Date category: Today, Yesterday, or date
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...entry.value.map((notification) => NotificationTile(notification)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

Map<String, List<Map<String, dynamic>>> groupNotificationsByDate() {
  final today = DateTime.now();
  final yesterday = today.subtract(const Duration(days: 1));

  Map<String, List<Map<String, dynamic>>> grouped = {
    "Today": [],
    "Yesterday": [],
  };

  for (var notification in DummyData.notify) {
    DateTime timestamp = DateTime.parse(notification['timestamp']);
    String dateKey;

    if (DateFormat('yyyy-MM-dd').format(timestamp) == DateFormat('yyyy-MM-dd').format(today)) {
      dateKey = "Today";
    } else if (DateFormat('yyyy-MM-dd').format(timestamp) == DateFormat('yyyy-MM-dd').format(yesterday)) {
      dateKey = "Yesterday";
    } else {
      dateKey = DateFormat('yyyy-MM-dd').format(timestamp);
    }

    grouped.putIfAbsent(dateKey, () => []).add(notification);
  }

  return grouped;
}
