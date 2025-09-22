import 'package:flutter/material.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class PaymentAddressCard extends StatelessWidget {
  const PaymentAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/mastercard.png', height: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visa ending  soon',
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyLarge,
                       Theme.of(context).textTheme.bodyLarge!.color!
                      ),
                    ),
                     const SizedBox(height: 4),
                        Text(
                      'Expires by 12/42',
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodySmall,
                         isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
              ),
                IconButton(onPressed: (){}, 
              icon: Icon(Icons.edit_outlined,
              color: Theme.of(context).primaryColor,
              ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
