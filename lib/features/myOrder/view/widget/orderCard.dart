import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

import 'package:watch_app/features/myOrder/model/order.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onViewDetails;

  const OrderCard({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ), // BoxShadow
        ],
      ), // BoxDecoration
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(order.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order # ${order.OrderNumber}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ), // Text
                      const SizedBox(height: 4),
                      Text(
                        '${order.itemCount} items - \$${order.totalAmount}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.bodyMedium,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),
                      const SizedBox(height: 8),
                      BuildStatusChip(context, order.statusString),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.shade200),

          InkWell(
            onTap: onViewDetails,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'View Details',
                style: AppTextstyle.withColor(
                  AppTextstyle.buttonMedium,
                  Theme.of(context).primaryColor,
                ),
              ), // Text
            ), // Padding
          ), // InkWell
        ],
      ), // Column
    );
  }

  Widget BuildStatusChip(BuildContext context, String type) {
    Color getStatusColor() {
      switch (type) {
        case "active":
          return Colors.blue;
        case "completed":
          return Colors.green;
        case "cancelled":
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ), // BoxDecoration
      child: Text(
        type.capitalize!,
        style: AppTextstyle.withColor(AppTextstyle.bodySmall, getStatusColor()),
      ), // Text
    );
  }
}
