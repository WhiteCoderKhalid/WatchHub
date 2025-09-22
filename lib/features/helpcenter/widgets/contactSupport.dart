import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ), // BoxDecoration
      child: Column(
        children: [
          Icon(
            Icons.headset_mic_outlined,
            color: Theme.of(context).primaryColor,
            size: 48,
          ), // Icon
          const SizedBox(height: 16),
          Text(
            'Still need help?',
            style: AppTextstyle.withColor(
              AppTextstyle.h3,
               Theme.of(context).textTheme.bodyLarge!.color!
               ),
          ), 
          const SizedBox(height: 16),
            Text(
            'Contact Our Support Team?',
            style: AppTextstyle.withColor(
              AppTextstyle.h3,
              isDark? Colors.grey[400]! : Colors.grey[600]!
               ),
               textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16), 

          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 37, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
             child: Text(
              "Contact Support",
              style: AppTextstyle.withColor(
              AppTextstyle.buttonMedium,
              Colors.white
               ),
             ))
        ],
      ), // Column
    );
  }
}
