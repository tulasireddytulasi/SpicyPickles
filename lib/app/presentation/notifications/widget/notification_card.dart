import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';

class NotificationTile extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationTile(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        leading: ClipOval(
          child: ColoredBox(
            color: AppColors.rosePink,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications, // Use different icons based on `notification['icon']`
                color: notification['isNew'] ? AppColors.vividOrange : AppColors.grey,
              ),
            ),
          ),
        ),
        title: Text(notification['title'], style: context.textStyle?.titleLarge),
        subtitle: Text(
          notification['description'],
          style: context.textStyle?.bodyMedium,
        ),
        trailing: Text(
          DateFormat('hh:mm a').format(DateTime.parse(notification['timestamp'])),
          style: context.textStyle?.titleSmall,
        ),
      ),
    );
  }
}
