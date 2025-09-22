import 'package:flutter/material.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: TextField(
        style: AppTextstyle.withColor(
          AppTextstyle.buttonMedium,
          Theme.of(context).textTheme.bodyLarge!.color!,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: AppTextstyle.withColor(
            AppTextstyle.buttonMedium,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
          suffixIcon: Icon(
            Icons.tune,
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
          filled: true,
          fillColor: isDark ? Colors.grey[800]! : Colors.grey[100]!,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
