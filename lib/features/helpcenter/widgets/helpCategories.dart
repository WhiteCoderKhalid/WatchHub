import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_app/features/helpcenter/widgets/categoriesCard.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class HelpCategories extends StatelessWidget {
  const HelpCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'Orders'},
      {'icon': Icons.payment_outlined, 'title': 'Payment'},
      {'icon': Icons.local_shipping_outlined, 'title': 'Shipping'},
      {'icon': Icons.assignment_return_outlined, 'title': 'Return'},
    ];
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help Categories',
            style: AppTextstyle.withColor(
              AppTextstyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: categories.length, // SliverGridDelegateWithFixedCrossAxisCount
            itemBuilder: (context, index) {
              return CategoryCard(
                title: categories[index]['title'] as String,
                icon: categories[index]['icon'] as IconData,
              ); // CategoryCard
            },
          ),
        ],
      ),
    );
  }
}
