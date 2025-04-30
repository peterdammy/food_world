import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:food_world/model/notification_model.dart';

final notificationProvider = Provider<List<NotificationModel>>((ref) {
  final now = DateTime.now();

  return [
    NotificationModel(
      title: 'Discount voucher!',
      time: now.subtract(Duration(minutes: 5)),
      icon: Icons.card_giftcard,
    ),
    NotificationModel(
      title: 'New update! Ver 2.0',
      time: now.subtract(Duration(minutes: 20)),
      icon: Icons.system_update_alt,
    ),
    NotificationModel(
      title: 'New message from guest',
      time: now.subtract(Duration(minutes: 35)),
      icon: Icons.email_outlined,
    ),
    NotificationModel(
      title: 'Discount voucher! 50%',
      time: now.subtract(Duration(minutes: 51)),
      icon: Icons.card_giftcard,
    ),
    NotificationModel(
      title: 'New year sale! 45%',
      time: now.subtract(Duration(days: 1, minutes: 51)),
      icon: Icons.card_giftcard,
    ),
    NotificationModel(
      title: 'Discount voucher! 75%',
      time: now.subtract(Duration(days: 1, hours: 5)),
      icon: Icons.card_giftcard,
    ),
  ];
});
