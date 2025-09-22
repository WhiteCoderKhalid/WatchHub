import 'package:flutter/material.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class AddressCardSection extends StatelessWidget {
  const AddressCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home",
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyLarge,
                      Theme.of(context).textTheme.bodyLarge!.color!
                      ),
                    ),
                    const SizedBox(height: 4),
                     Text(
                      "12  Savannah  Building Abeokuta 110242, Nigeria ",
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyLarge,
                      isDark? Colors.grey[400]! : Colors.grey[600]!
                      ),
                    )
                  ],
                ),
              ),
              IconButton(onPressed: (){}, 
              icon: Icon(Icons.edit_outlined,
              color: Theme.of(context).primaryColor,
              ),
              
              )
            ],
          ),
        ],
      ),
    );
  }
}
