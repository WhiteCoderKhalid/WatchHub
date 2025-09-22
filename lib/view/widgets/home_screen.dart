import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/theme_controller.dart';
import 'package:watch_app/features/notifications/view/notification_screen.dart';
import 'package:watch_app/view/widgets/allProduct_screen.dart';
import 'package:watch_app/view/widgets/cart_screen.dart';
import 'package:watch_app/view/widgets/categorieschip_screen.dart';
import 'package:watch_app/view/widgets/customSearchbar.dart';
import 'package:watch_app/view/widgets/productGrid_screen.dart';
import 'package:watch_app/view/widgets/salesBanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Home Screen"))
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //header Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Alex",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  //notification icon
                  IconButton(
                    onPressed: () => Get.to(() => NotificationScreen()),
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  //cart icon
                  IconButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                  //theme button
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),

            //Search bar
            const CustomSearchBar(),

            //categories Section
            const CategoriesChips(),

            //sales banner
            const SalesBanner(),

            //popularProduct
            Padding(padding: EdgeInsetsGeometry.symmetric(
              vertical: 8,
              horizontal: 16
            ), child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular product", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )),
                GestureDetector(
                  onTap: ()=> Get.to(()=> AllProductScreen()),
                  child: Text("SEE ALL",style: TextStyle(
                     color: Theme.of(context).primaryColor
                  )),
                )
              ],
            )),
            // Product Grid
            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
