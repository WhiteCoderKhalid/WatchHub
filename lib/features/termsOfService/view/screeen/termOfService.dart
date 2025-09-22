import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/Privacy/views/widgets/infoSection_screen.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class TermOfService extends StatelessWidget {
  const TermOfService({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
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
          'Terms Of Service',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: 'Welcome to Watch Store',
                content:
                    'By Accessing and using this application , you accept and agree  to be bound by  the terms And provision of this agreement',
              ),
              InfoSection(
                title: 'Account Registration',
                content:
                    'By Accessing and using this application , you accept and agree  to be bound by  the terms And provision of this agreement',
              ),
              InfoSection(
                title: 'User Responsibilities',
                content:
                    'By Accessing and using this application , you accept and agree  to be bound by  the terms And provision of this agreement',
              ),
              InfoSection(
                title: 'Privacy Policy',
                content:
                    'By Accessing and using this application , you accept and agree  to be bound by  the terms And provision of this agreement',
              ),
              InfoSection(
                title: 'Intellectual Property',
                content:
                    'By Accessing and using this application , you accept and agree  to be bound by  the terms And provision of this agreement',
              ),
              InfoSection(
                title: 'Termination',
                content:
                    'By Accessing and using this application , you accept and agree  to be bound by  the terms And provision of this agreement',
              ),
              const SizedBox(height: 24),
              Text(
                "Last Time Updated : September 9",
                style: AppTextstyle.withColor(
                  AppTextstyle.h3,
                  isDark ? Colors.grey[300]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
