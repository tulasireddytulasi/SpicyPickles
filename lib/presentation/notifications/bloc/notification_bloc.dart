import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:spicypickles/presentation/notifications/dummy_data.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationInitial()) {
    on<FetchNotifications>(_fetchNotifications);
  }

  Future<FutureOr<void>> _fetchNotifications(FetchNotifications event, Emitter<NotificationState> emit) async {
    try {
      emit(const NotificationLoading());

      /// Step 1: Fetch Data from API
      final response = await fetchNotificationsFromAPI();
      final List<Map<String, dynamic>> notifications = response;

      /// Step 2: Process Data (Group by Date)
      Map<String, List<Map<String, dynamic>>> groupedNotifications = groupNotificationsByDate(notifications);

      /// Step 3: Emit Loaded State with Processed Data
      emit(NotificationLoaded(groupedNotifications));
    } catch (error, s) {
      log("Error: $error");
      log("Error stack: $s");
      emit(NotificationError("Failed to load notifications: $error"));
    }
  }

  Future<List<Map<String, dynamic>>> fetchNotificationsFromAPI() async {
    return DummyData.notify;

    /// Simulated API response
    final String apiResponse = DummyData.notify.toString();
    return Future.delayed(const Duration(seconds: 1), () =>
    List<Map<String, dynamic>>.from(json.decode(apiResponse)));
  }

  Map<String, List<Map<String, dynamic>>> groupNotificationsByDate(List<Map<String, dynamic>> notifications) {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    Map<String, List<Map<String, dynamic>>> grouped = {
      "Today": [],
      "Yesterday": [],
    };

    for (var notification in notifications) {
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
}
