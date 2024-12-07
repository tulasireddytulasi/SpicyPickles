import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationTile extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationTile(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.notifications, // Use different icons based on `notification['icon']`
        color: notification['isNew'] ? Colors.blue : Colors.grey,
      ),
      title: Text(notification['title']),
      subtitle: Text(notification['description']),
      trailing: Text(
        DateFormat('hh:mm a').format(DateTime.parse(notification['timestamp'])),
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}