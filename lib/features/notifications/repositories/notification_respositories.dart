
import 'package:watch_app/features/notifications/models/notification_typedata.dart';

class NotificationRepository {
  List<NotificationItem> getNotifications() {
    return const [
      NotificationItem(
        title: 'Order Confirmed',
        message: 'Your order #123456 has been confirmed ',
        time: '2 minutes ago',
        type: NotificationType.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Special Offered',
        message: 'Get 20% of all Watches this Weekend',
        time: '1 Hours ago',
        type: NotificationType.promo,
        isRead: true,
      ),
       NotificationItem(
        title: 'Out for Delivery',
        message: 'Your order #1234456 has been out of  delivery',
        time: '3 hour ago',
        type: NotificationType.delivery,
        isRead: true,
      ),
       NotificationItem(
        title: 'Payment Successfully',
        message: 'Your Payment for #145436 has been successfully',
        time: '2 minutes ago',
        type: NotificationType.payment,
        isRead: true,
      ),
    ];
  }
}