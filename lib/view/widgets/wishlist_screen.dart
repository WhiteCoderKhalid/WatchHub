import 'package:flutter/material.dart';
import 'package:watch_app/models/products.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Wishlish",
          style: AppTextstyle.withColor(
            AppTextstyle.bodyLarge,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          // summary Section
          SliverToBoxAdapter(child: BuildSummarySection(context)),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildWishlistItem(
                  context,
                  products.where((p) => p.isFavorite).toList()[index],
                ),
                childCount: products.where((p) => p.isFavorite).length,
              ), // SliverChildBuilderDelegate // SliverList
            ), //
          ),
        ],
      ),
    );
  }

  Widget BuildSummarySection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final favouriteProduct = products.where((p) => p.isFavorite).length;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[100],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$favouriteProduct items',
                style: AppTextstyle.withColor(
                  AppTextstyle.h2,
                  Theme.of(context).textTheme.bodyMedium!.color!,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'In  Your Wishlist',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              "Add All To Cart",
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistItem(BuildContext context, Product product) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(
                    0.1,
                  ), // Assuming a light color for light theme, based on common practice
            blurRadius: 8,
            offset: const Offset(0, 2), // Corrected offset as seen in the image
          ), // BoxShadow
        ],
      ),
      child: Row(
        //product image
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              product.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyLarge,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ), // Text
                  const SizedBox(height: 8),

                  Text(
                    product.category,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodySmall,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_outlined,
                              color: isDark
                                  ? Colors.grey[400]
                                  : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ), // Column
            ), // Padding
          ),
        ],
      ),
    ); // Container
  }
}
