import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/navigation_controler.dart';

class CustomBottomNavbar extends StatelessWidget {
  CustomBottomNavbar({super.key});
  final NavigationControler navigationController = Get.find<NavigationControler>();
   
    @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: navigationController.currentIndex.value,
        onTap: (index) => navigationController.changeIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'),
             BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shopping'),
             BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Wishlist'),
             BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Account'),
            ],
      ),
    );
  }
}
