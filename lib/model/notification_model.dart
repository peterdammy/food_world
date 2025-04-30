import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final DateTime time;
  final IconData icon;

  NotificationModel({
    required this.title,
    required this.time,
    required this.icon,
  });
}
