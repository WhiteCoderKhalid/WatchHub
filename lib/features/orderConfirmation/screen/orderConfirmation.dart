import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:watch_app/features/myOrder/view/screen/order_screen.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/shopping_screen.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String orderNumber;
  final double totalAmount;
  const OrderConfirmationScreen({
    super.key,
    required this.orderNumber,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/animations/done.json",
                width: 100,
                height: 100,
                repeat: false,
              ),
              const SizedBox(height: 32),
              Text(
                "Order Confirmed",
                textAlign: TextAlign.center,
                style: AppTextstyle.withColor(
                  AppTextstyle.h2,
                  isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Your Order $orderNumber has been successfully placed",
                textAlign: TextAlign.center,
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => OrderScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Track Order",
                  style: AppTextstyle.withColor(
                    AppTextstyle.buttonMedium,
                    Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                   Get.offAll(() => ShoppingScreen());
                },
                child: Text(
                  "Continue Shopping",
                  style: AppTextstyle.withColor(
                    AppTextstyle.buttonMedium,
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
