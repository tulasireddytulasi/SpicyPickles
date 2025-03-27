import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/presentation/notifications/bloc/notification_bloc.dart';
import 'package:spicypickles/app/presentation/notifications/widget/notification_widget_exports.dart';
import 'package:spicypickles/app/presentation/widgets/widget_exports.dart';

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
        title: Text(
          "Notification",
          style: context.themeData.appBarTheme.titleTextStyle?.copyWith(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
       backgroundColor: AppColors.white,
        leading: CircularIconWidget(
          icon: Icons.arrow_back_ios_rounded,
          padding: const EdgeInsets.all(8.0),
          onTap: () => Navigator.pop(context),
          size: 22,
        ),
      ),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (BuildContext context, NotificationState state) {},
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NotificationLoaded) {
            return ListView(
              children: state.groupedNotifications.entries.map((entry) {
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
            );
          } else if (state is NotificationError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("No Notifications"));
          }
        },
      ),
    );
  }
}
