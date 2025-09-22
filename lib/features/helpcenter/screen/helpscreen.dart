import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/helpcenter/widgets/contactSupport.dart';
import 'package:watch_app/features/helpcenter/widgets/helpCategories.dart';
import 'package:watch_app/features/helpcenter/widgets/popularQuestion_screen.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: isDark ? Colors.white : Colors.black,
        ),

        title: Text(
          "Help Center",
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(context , isDark),
            const SizedBox(height: 24,),
            PopularQuestionSection(),
            const SizedBox(height: 24,),
            HelpCategories(),
            ContactSupport(),
          ],
        ),
      ),
    );
  }




Widget _buildSearchBar(BuildContext context, bool isDark){
  return Container(
        margin: EdgeInsetsGeometry.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2)
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search For Help",
          hintStyle:  AppTextstyle.withColor(
            AppTextstyle.bodyMedium,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
          prefixIcon: Icon(Icons.search,
          color: isDark ?  Colors.grey[400]: Colors.grey[600]!),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor
        ),
      ),
  );
}





}
