import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const QuestionCard({super.key, required this.title, required this.icon});

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
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: AppTextstyle.withColor(
            AppTextstyle.bodyMedium,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
          size: 16,
        ),
        onTap: () => showAnswerButtomSheet(context, title, isDark),
      ),
    );
  }

  void showAnswerButtomSheet(
    BuildContext context,
    String question,
    bool isDark,
  ) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: AppTextstyle.withColor(
                      AppTextstyle.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Text(
              _getAnswer(question),
              style: AppTextstyle.withColor(
                AppTextstyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12)
                  )
                ),
                child: Text(
                  'Got It',
                  style: AppTextstyle.withColor(
                    AppTextstyle.buttonMedium,
                    Colors.white,
                  ), // Text
                ), // ElevatedButton
              ), // SizedBox
            ),
           
          ],
        ), // Container
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent
    );
  }

  String _getAnswer(String question) {
    final answers = {
      'How To Track My Order?':
          'To track your order \n'
          'To track your order\n'
          '1. Go to "My Orders" in your account\n'
          '2. Select the order you want to track\n'
          '3. Click on "Track Order"\n'
          '4. You\'ll see real time updates about your package.\n\n'
          'You can also click on the tracking number in your order confimation email to track the package again.',
      'How to return an item?':
          'To return an item:\n\n'
          '1. Go to "My Orders" in your account\n'
          '2. Select the order with the items you want to return \n'
          '3. Click on "Return Items"\n'
          '4. Select the reason for return \n'
          '5. Print the Return label\n'
          '6 Pack the items Securly\n'
          '7. Drop of the Packages at the nearest shipping location"\n'
          'Return must be initialized within 30 days of delivery. Once we recieved the items, your refund we be proccessed in 5 min',
    };
    return answers[question] ??
        'Information Not Available, Please  Contact Support For Assistance';
  }
}
