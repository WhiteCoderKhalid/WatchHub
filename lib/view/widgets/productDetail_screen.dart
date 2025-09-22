import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:watch_app/models/products.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/sizeSelector_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          //share button
          IconButton(
            // Assuming IconButton is part of the body
            onPressed: () =>
                _shareProduct(context, product.name, product.description),
            icon: Icon(
              Icons.share,
              color: isDark
                  ? Colors.white
                  : Colors
                        .black, // Assuming Colors.black for the alternative color
            ), // Icon
          ), // IconButton
        ], // Text
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                // image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // favorite button
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite
                          ? Theme.of(context).primaryColor
                          : isDark
                          ? Colors.white
                          : Colors.black,
                    ), // Icon
                  ), // IconButton
                ), // Positioned// Image.asset
              ],
            ),
            // product details
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppTextstyle.withColor(
                            AppTextstyle.h2,
                            Theme.of(context).textTheme.headlineMedium!.color!,
                          ),
                        ), // Text
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.h2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),
                      // Expanded
                    ],
                  ),
                  Text(
                    product.category,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Select Size",
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      Theme.of(context).textTheme.headlineMedium!.color!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  const SizeSelector(),

                  SizedBox(height: screenHeight * 0.01),

                  Text(
                    "Description",
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      Theme.of(context).textTheme.headlineMedium!.color!,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    product.description,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodySmall,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ],
              ), // Column
            ), // Padding
          ],
        ), // Column
      ),
      // buttons
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ), // EdgeInsets.symmetric
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ), // BorderSide
                  ),
                  child: Text(
                    'Add To Cart',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).textTheme.headlineMedium!.color!,
                    ),
                  ),
                ), // OutlinedButton
              ),
              SizedBox(width: screenWidth * 0.04),

              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).primaryColor, // EdgeInsets.symmetric // BorderSide
                  ),
                  child: Text(
                    'Buy Now',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                     Colors.white,
                    ),
                  ),
                ), // OutlinedButton
              ),
            ],
          ),
        ),
      ),
      // AppBar
    ); // Scaffold
  }

  //share product
  Future<void> _shareProduct(
    BuildContext context,
    String productName,
    String description,
  ) async {
    // get the render box for share position origin (required for iPa
    final box = context.findRenderObject() as RenderBox?;

    const String shopLink = 'https://yourshop.com/product';
    final String shareMessage = '$description\n\nShop now at $shopLink';

    try {
      final ShareResult result = await Share.share(
        shareMessage,
        subject: productName,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      if (result.status == ShareResultStatus.success) {
        debugPrint("Thank for sharing");
      }
    } catch (e) {
      debugPrint("Error Sharing : $e");
    } // Empty catch block.Try adding statements to the block
  }
}
