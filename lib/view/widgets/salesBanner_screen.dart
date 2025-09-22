import 'package:flutter/material.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class SalesBanner extends StatelessWidget {
  const SalesBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Your",
                  style: AppTextstyle.withColor(AppTextstyle.h3, Colors.white),
                ),
                Text(
                  "Special Sales",
                  style: AppTextstyle.withColor(
                    AppTextstyle.withWeight(AppTextstyle.h2, FontWeight.bold),
                    Colors.white,
                  ),
                ),
                 Text(
                  "Up To 30%",
                  style: AppTextstyle.withColor(AppTextstyle.h3, Colors.white),
                )
              ],
            ),
          ),
          ElevatedButton(onPressed: (){}, 
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 10,
              )
          ),
          child: Text("Shop Now", style: AppTextstyle.buttonSmall,))
        ],
      ),
    );
  }
}
