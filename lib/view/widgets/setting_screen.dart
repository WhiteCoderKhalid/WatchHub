import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/theme_controller.dart';
import 'package:watch_app/features/Privacy/views/screens/privacyPolicy_screen.dart';
import 'package:watch_app/features/termsOfService/view/screeen/termOfService.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          "Settings ",
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(context, 'Appearance', [buildThemeToggle(context)]),

            buildSection(context, 'Notifications', [
              buildSwitchTile(
                context,
                'Push Notification',
                'Receive push notifications about orders and promotions',
                true,
              ),

              buildSwitchTile(
                context,
                'Email Notification',
                'Receive Email notifications about orders and promotions',
                false,
              ),
            ]),

            buildSection(context, 'Privacy', [
              buildNavigationTile(
                context,
                'Privacy Policy',
                'View Our Privacy Policy',
                Icons.privacy_tip_outlined,
                onTap: () => Get.to( () => PrivacyPolicy()),
              ),

              buildNavigationTile(
                context,
                'Terms Of  Service',
                'Read Our Terms  And Regulation',
                Icons.description,
                onTap: () => Get.to( () => TermOfService()),
              ),
            ]),

            buildSection(context, 'About', [
              buildNavigationTile(
                context,
                'App Version',
                '1.0.0',
                Icons.info_outline,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final isDark =
        Theme.of(context).brightness ==
        Brightness.dark; // Corrected line based on common Flutter patterns

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            24,
            24,
            24,
            8,
          ), // Adjusted padding slightly for common usage
          child: Text(
            title,
            style: AppTextstyle.withColor(
              AppTextstyle.h2,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
        ),
        ...children, // Spread operator to include the list of children widgets
      ],
    );
  }

  Widget buildThemeToggle(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GetBuilder<ThemeController>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            "Dark Mode",
            style: AppTextstyle.withColor(
              AppTextstyle.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          trailing: Switch.adaptive(
            value: controller.isDarkMode,
            onChanged: (value) => controller.toggleTheme(),
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget buildSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    bool initialValue,
    // required ValueChanged<bool> onChanged,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextstyle.withColor(
            AppTextstyle.bodyMedium,
            Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextstyle.withColor(
            AppTextstyle.bodySmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        trailing: Switch.adaptive(
          value: initialValue,
          onChanged: (value) {},
          activeColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget buildNavigationTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,{
    VoidCallback? onTap
    }
    
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
   
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor), // Icon
          title: Text(
            title,
            style: AppTextstyle.withColor(
              AppTextstyle.bodyMedium,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextstyle.withColor(
              AppTextstyle.bodyMedium,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
          onTap: onTap, // Icon // Text
        ),
      ),
    );
  }
}
