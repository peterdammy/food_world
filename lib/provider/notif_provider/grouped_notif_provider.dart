import 'package:food_world/model/notification_model.dart';

Map<String, List<NotificationModel>> groupNotificationsByDay(
  List<NotificationModel> notifications,
) {
  final Map<String, List<NotificationModel>> grouped = {};

  final now = DateTime.now();

  for (var notification in notifications) {
    final difference = now.difference(notification.time);
    String key;

    if (difference.inDays == 0) {
      key = 'Today';
    } else if (difference.inDays == 1) {
      key = 'Yesterday';
    } else {
      key =
          '${notification.time.day}/${notification.time.month}/${notification.time.year}';
    }

    grouped.putIfAbsent(key, () => []).add(notification);
  }

  return grouped;
}
