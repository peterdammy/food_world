import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/provider/notif_provider/grouped_notif_provider.dart';
import 'package:food_world/provider/notif_provider/notification_provider.dart';
import 'package:food_world/views/styles/font_styles.dart';
import 'package:intl/intl.dart';

class NotifScreen extends ConsumerWidget {
  const NotifScreen({super.key});

  String formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) return '${diff.inMinutes}min ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return DateFormat('dd MMM yyyy').format(time);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationProvider);
    final grouped = groupNotificationsByDay(notifications);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 55.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22).r,
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(offset: Offset(0, 4), blurRadius: 4.r),
                      ],
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 24.h,
                        ),
                      ),
                    ),
                  ),
                  50.horizontalSpace,
                  Text(
                    'Notifications',
                    style: FontStyles.mediumText(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              50.verticalSpace,
              ...grouped.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: FontStyles.smallboldText(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      10.verticalSpace,
                      ...entry.value.map((notif) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 50.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20).r,
                              color: Theme.of(context).colorScheme.surface,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 5),
                                  blurRadius: 5.r,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                notif.icon,
                                color: Colors.orange[400],
                              ),
                            ),
                          ),
                          // leading: CircleAvatar(
                          //   backgroundColor: Colors.orange.shade100,
                          //   child: Icon(notif.icon, color: Colors.orange),
                          // ),
                          title: Text(
                            notif.title,
                            style: FontStyles.smallerBoldText(
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          subtitle: Text(
                            formatTimeAgo(notif.time),
                            style: FontStyles.smallerText(
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      }).toList(),
                      20.verticalSpace,
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
