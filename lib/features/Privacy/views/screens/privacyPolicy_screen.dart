import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/Privacy/views/widgets/infoSection_screen.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ), // Icon
        ), // IconButton
        title: Text(
          'Privacy Policy',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: " Informatiion We Colected",
                content:
                    "We collect the information you have provided , directly to us , including name, email, address and shipping information",
              ),
              InfoSection(
                title: " How We Use Your Informatiion ",
                content:
                    "We use  the information we collected to provide, maintain and improve our services ,  process your transaction and send you update",
              ),
              InfoSection(
                title: " Data  Security",
                content:
                    "We collect the information you have provided , directly to us , including name, email, address and shipping information",
              ),
              InfoSection(
                title: " Yours  Right",
                content:
                    "We collect the information you have provided , directly to us , including name, email, address and shipping information",
              ),
              InfoSection(
                title: " Cookies Policy",
                content:
                    "We collect the information you have provided , directly to us , including name, email, address and shipping information",
              ),
              const SizedBox(height: 24),
              Text(
                "Last Time Updated : September 9",
                style: AppTextstyle.withColor(
                  AppTextstyle.h3,
                   isDark ? Colors.grey[300]! : Colors.grey[600]!
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
