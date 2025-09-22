import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          buildSummaryRow(context, 'subTotal', '\$599.93'),
          const SizedBox(height: 8),
          buildSummaryRow(context, 'Shipping', '\$10.93'),
          const SizedBox(height: 8),
           buildSummaryRow(context, 'Tax', '\$53.00'),
           Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 12),
            child: Divider(),
            ),
            buildSummaryRow(context, 'Total', '\$663.86', isTotal: true),
          ],
      ),
    );
  }

  Widget buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    bool isTotal = false,
  }) {
    final textStyle = isTotal ? AppTextstyle.h3 : AppTextstyle.bodyLarge;
    final color = isTotal
        ? Theme.of(context).primaryColor
        : Theme.of(context).textTheme.bodyLarge!.color!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextstyle.withColor(textStyle, color),
        ),
           Text(
          value,
          style: AppTextstyle.withColor(textStyle, color),
        ),
      ],
    );
  }
}
