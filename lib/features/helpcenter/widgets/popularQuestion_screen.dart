import 'package:flutter/material.dart';
import 'package:watch_app/features/helpcenter/widgets/questionCard.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class PopularQuestionSection extends StatelessWidget {
  const PopularQuestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Question',
            style: AppTextstyle.withColor(
              AppTextstyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
         QuestionCard(
          title: "How To Track My Order?", 
          icon: Icons.local_shipping_outlined),
          const SizedBox(height: 16),
         QuestionCard(
          title: "How to return an item?", 
          icon: Icons.local_shipping_outlined)
        ],
      ),
    );
  }
}
