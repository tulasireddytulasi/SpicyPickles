part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();
}

final class NotificationInitial extends NotificationState {
  const NotificationInitial();

  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {
  const NotificationLoading();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class NotificationLoaded extends NotificationState {
  final Map<String, List<Map<String, dynamic>>> groupedNotifications;

  const NotificationLoaded(this.groupedNotifications);

  @override
  List<Object?> get props => [groupedNotifications];
}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError(this.message);

  @override
  List<Object?> get props => [message];
}
