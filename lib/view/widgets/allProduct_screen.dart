import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/filterBottomSheet_screen.dart';
import 'package:watch_app/view/widgets/productGrid_screen.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
          'All Products',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
             isDark ? Colors.white : Colors.black
          ),
    
        ),
        actions: [
          //search button
           IconButton(
            onPressed:(){},
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          IconButton(
            onPressed:() => FilterBottomSheet.show(context),
            icon: Icon(
              Icons.filter_list,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
