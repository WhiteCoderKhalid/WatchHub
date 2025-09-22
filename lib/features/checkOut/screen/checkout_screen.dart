import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/checkOut/widgets/addresscardSection.dart';
import 'package:watch_app/features/checkOut/widgets/checkBottomBar.dart';
import 'package:watch_app/features/checkOut/widgets/oderSummaryCard.dart';
import 'package:watch_app/features/checkOut/widgets/paymentAddressCard.dart';
import 'package:watch_app/features/orderConfirmation/screen/orderConfirmation.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ), // Icon
        ), // IconButton
        title: Text(
          'CheckOut',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            builSectionTile(context, "Shipping Address"),
            const SizedBox(height: 16),
            AddressCardSection(),
            const SizedBox(height: 24),
            builSectionTile(context, "Payment Method"),
            const SizedBox(height: 16),
            PaymentAddressCard(),
            const SizedBox(height: 24),
            builSectionTile(context, "Order Summary"),
            const SizedBox(height: 16),
            OrderSummaryCard()

          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        totalAmount: 663.86,
        onPlaceOrder: (){
          //generate a random order number(coming for the back end)
          final orderNumber = 'ORDER${DateTime.now().microsecondsSinceEpoch.toString().substring(7)}';
          Get.to(() => OrderConfirmationScreen(
            orderNumber: orderNumber,
            totalAmount: 663.86,
          ));
        },
      ),
    );
  }

  builSectionTile(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextstyle.withColor(
        AppTextstyle.h3,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
    );
  }
}
