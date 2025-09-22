import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/auth_controller.dart';
import 'package:watch_app/features/editProfile/screen/editProfile_screen.dart';
import 'package:watch_app/features/helpcenter/screen/helpscreen.dart';
import 'package:watch_app/features/myOrder/view/screen/order_screen.dart';
import 'package:watch_app/features/shipping/widgets/shippingAdress_screen.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/setting_screen.dart';
import 'package:watch_app/view/widgets/signIn_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " My Account ",
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => SettingScreen()),
            icon: Icon(
              Icons.settings,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BuildProfileSection(context),
            const SizedBox(height: 16),
            BuildMenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget BuildProfileSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.grey[100],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
          const SizedBox(height: 16),
          Text(
            "Alex Johnson",
            style: AppTextstyle.withColor(
              AppTextstyle.h2,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Alexjohnson@Gmail.com",
            style: AppTextstyle.withColor(
              AppTextstyle.bodyMedium,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () => Get.to(() => EditProfileScreen()),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              side: BorderSide(color: isDark ? Colors.white70 : Colors.black12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Edit Profile",
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildMenuSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final menuItems = [
      {'icon': Icons.shopping_bag_outlined, "title": 'My Order'},
      {'icon': Icons.location_on_outlined, "title": 'Shipping Address'},
      {'icon': Icons.help_outline, "title": 'Help Center'},
      {'icon': Icons.logout_outlined, "title": 'Logout'},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: menuItems.map((items) {
          return Container(
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(
                items['icon'] as IconData,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                items['title'] as String,
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
              onTap: () {
                if (items["title"] == 'Logout') {
                  ShowLogoutDialog(context);
                } else if (items["title"] == 'My Order') {
                  // navigation to my order screen
                  Get.to(() => OrderScreen());
                } else if (items["title"] == 'Shipping Address') {
                  //navigation to my Shipping Address screen
                  Get.to(() => ShippingAddress());
                } else if (items["title"] == 'Help Center') {
                  //navigation to my help center screen
                  Get.to(() => HelpScreen());
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  void ShowLogoutDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.dialog(
      AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Are You Sure You Want To Log Out',
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: Text(
                      "Cancel",
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // final AuthController authController = Get.find<AuthController>() ;
                      // authController.logout();
                      // Get.offAll(()=> SigninScreen());

                      final AuthController authController =
                          Get.find<AuthController>();
                      //show loading indicator
                      Get.dialog(
                        const Center(child: CircularProgressIndicator()),
                        barrierDismissible: false,
                      );
                      try {
                        final result = await authController.signOut();
                        // close loading dialog
                        Get.back();

                        if (result.success) {
                          Get.snackbar(
                            'Success',
                            result.message,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                          Get.offAll(() => SigninScreen());
                        } else {
                          Get.snackbar(
                            'Error',
                            result.message,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      } catch (e) {
                        Get.back();
                         Get.snackbar(
                            'Error',
                            "Anu unexpected Error Occured . Please Try Again ",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Logout",
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
