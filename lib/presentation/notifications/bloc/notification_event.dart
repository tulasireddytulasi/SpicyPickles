part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent extends Equatable {
  const NotificationEvent();
}

final class FetchNotifications extends NotificationEvent {
  const FetchNotifications();

  @override
  List<Object> get props => [];
}
