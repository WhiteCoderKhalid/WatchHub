import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class FilterBottomSheet {
  static void show(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),builder: (context) => StatefulBuilder(
  builder: (context, setState) => SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter Product",
                style: AppTextstyle.withColor(
                  AppTextstyle.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Price Range
          Text(
            "Price Range",
            style: AppTextstyle.withColor(
              AppTextstyle.bodyLarge,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Min',
                    prefixText: '\$',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Max',
                    prefixText: '\$',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Categories
          Text(
            "Categories",
            style: AppTextstyle.withColor(
              AppTextstyle.bodyLarge,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ["All", "Rolex", "Jacob@Co", "Richard Mille"].map((category) {
              return FilterChip(
                label: Text(category),
                selected: category == "All",
                backgroundColor: Theme.of(context).cardColor,
                selectedColor:
                    Theme.of(context).primaryColor.withOpacity(0.2),
                labelStyle: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
                  category == 'All'
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.bodyLarge!.color!,
                ),
                onSelected: (selected) {},
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Apply filters",
                style: AppTextstyle.withColor(
                  AppTextstyle.buttonMedium,
                  Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

    );
  }
}
