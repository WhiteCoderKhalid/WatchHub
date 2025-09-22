import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/navigation_controler.dart';
import 'package:watch_app/controllers/theme_controller.dart';
import 'package:watch_app/view/widgets/custombottomNavbar.dart';
import 'package:watch_app/view/widgets/home_screen.dart';
import 'package:watch_app/view/widgets/shopping_screen.dart';
import 'package:watch_app/view/widgets/wishlist_screen.dart';
import 'package:watch_app/view/widgets/account_screen.dart';



class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final NavigationControler navigationController = Get.put(
    NavigationControler(),
  );
  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Obx(
              () => IndexedStack(
                key: ValueKey(navigationController.currentIndex.value),
                index: navigationController.currentIndex.value,
                children: [
                  HomeScreen(),
                  ShoppingScreen(),
                  WishlistScreen(),
                  AccountScreen(),
                ],
              ),
            ),
          ),
          bottomNavigationBar:  CustomBottomNavbar(),
        );
      },
    );
  }
}


