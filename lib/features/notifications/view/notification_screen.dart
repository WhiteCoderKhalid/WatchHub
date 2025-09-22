import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/notifications/models/notification_typedata.dart';
import 'package:watch_app/features/notifications/repositories/notification_respositories.dart';
import 'package:watch_app/features/notifications/utils/notifications_util.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final NotificationRepository repository = NotificationRepository();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifications = repository.getNotifications();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: isDark ? Colors.white : Colors.black,
        ),

        title: Text(
          "Notification",
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            // style: TextButton.styleFrom(
            //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //   foregroundColor: Theme.of(
            //     context,
            //   ).primaryColor, // color for ripple + text
            // ),
            child: Text(
              'Mark All As Read',
              style: AppTextstyle.withColor(
                AppTextstyle.bodyMedium,
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) =>
            buildNotificationCard(context, notifications[index]),
      ),
    );
  }

  Widget buildNotificationCard(
    BuildContext context,
    NotificationItem notification,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsetsGeometry.only(bottom: 16),
      decoration: BoxDecoration(
        color: notification.isRead
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: NotificationUtils.getIconBackgroundColor(
              context,
              notification.type,
            ),
            shape: BoxShape.circle,
          ), // BoxDecoration
          child: Icon(
            NotificationUtils.getNotificationIcon(notification.type),
            color: NotificationUtils.getIconColor(context, notification.type),
          ),
        ),
        title: Text(
          notification.title,
          style: AppTextstyle.withColor(
            AppTextstyle.bodyLarge,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ), // Text
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.message,
              style: AppTextstyle.withColor(
                AppTextstyle.bodySmall,
                isDark ? Colors.grey[400]! :Colors.grey[600]!
              ),
            ),
          ],
        ),
      ),
    );
  }
}
