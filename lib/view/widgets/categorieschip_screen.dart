import 'package:flutter/material.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class CategoriesChips extends StatefulWidget {
  const CategoriesChips({super.key});

  @override
  State<CategoriesChips> createState() => _CategoriesChipsState();
}

class _CategoriesChipsState extends State<CategoriesChips> {
  int selectedIndex = 0;
  final categories = ['All', 'Rolex', 'Jacob@Co', 'Richard Mille'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: EdgeInsetsGeometry.only(right: 12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: ChoiceChip(
                label: Text(
                  categories[index],
                  style: AppTextstyle.withColor(
                    selectedIndex == index
                        ? AppTextstyle.withWeight(
                            AppTextstyle.bodySmall,
                            FontWeight.w600,
                          )
                        : AppTextstyle.bodySmall,
                    selectedIndex == index
                        ? Colors.white
                        : isDark
                        ? Colors.grey[300]!
                        : Colors.grey[600]!,
                  ),
                ),
                selected: selectedIndex == index,
                // onSelected: (bool selected) {
                //   setState(() {
                //     selectedIndex == selected ? index : selectedIndex;
                //   });
                // },
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = index; // ✅ FIXED
                  });
                },
                selectedColor: Theme.of(context).primaryColor,
                backgroundColor: isDark ? Colors.grey[800]! : Colors.grey[100]!,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                elevation: selectedIndex == index ? 2 : 0,
                pressElevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                // labelPadding: const EdgeInsets.symmetric(
                //   horizontal: 4,
                //   vertical: 1,
                // ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(
                  color: selectedIndex == index
                      ? Colors.transparent
                      : isDark
                      ? Colors.grey[700]!
                      : Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
