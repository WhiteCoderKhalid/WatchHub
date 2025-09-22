import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/shipping/model/address.dart';
import 'package:watch_app/features/shipping/repository/address_repository.dart';
import 'package:watch_app/features/shipping/widgets/addressCard.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class ShippingAddress extends StatelessWidget {
  final AddressRepository repository = AddressRepository();
  ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "Shipping Address",
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showAddressBottomSheet(context),
            icon: Icon(
              Icons.add_circle_outline,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: repository.getAddresses().length,
        itemBuilder: (context, index) => buildAddressCard(context, index),
      ),
    );
  }

  /// Helper method to build address card
  Widget buildAddressCard(BuildContext context, int index) {
    final address = repository.getAddresses()[index];
    return AddressCard(
      address: address,
      onEdit: () => _showEditAddressBottomSheet(context, address),
      onDelete: () => _showDeleteConfirmation(context),
    );
  }

  void _showEditAddressBottomSheet(BuildContext context, Address address) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit Address',
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
            _buildTextField(
              context,
              'label (e.g Home, Office)',
              Icons.label_outline,
              initialValue: address.label,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              'Full Address',
              Icons.location_on_outlined,
              initialValue: address.fullAddress,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              'City',
              Icons.location_city_outlined,
              initialValue: address.city,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    context,
                    'State',
                    Icons.map_outlined,
                    initialValue: address.state,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    context,
                    'Zip Code',
                    Icons.pin_outlined,
                    initialValue: address.zipCode,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Update Address",
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
      isScrollControlled: true,
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.dialog(
      AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ), // RoundedRectangleBorder
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.delete_outline, size: 32, color: Colors.red),
            ),

            const SizedBox(height: 16),

            Text(
              "Delete Address",
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Are You Sure You Want To Delete The Address",
              textAlign: TextAlign.center,
              style: AppTextstyle.withColor(
                AppTextstyle.bodyMedium,
                isDark ? Colors.grey[800]! : Colors.grey[500]!,
              ),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      // backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      //handle the delete of address
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Delete",
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Container
          ],
        ),
      ),
      barrierColor: Colors.black,
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    IconData icon, {
    String? initialValue,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ), // BorderSide
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
        ), //
      ), //
    ); // TextFormField
  }

  void _showAddressBottomSheet(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add New Address",
                  style: AppTextstyle.withColor(
                    AppTextstyle.h2,
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
            ), // Row
            const SizedBox(height: 24),

            _buildTextField(
              context,
              'label (e.g Home, Office)',
              Icons.label_outline,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              'Full Address',
              Icons.location_on_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(context, 'City', Icons.location_city_outlined),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildTextField(context, 'State', Icons.map_outlined),
                ),

                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    context,
                    'Zip Code',
                    Icons.pin_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // handle save address
                  Get.back();
                },
                 style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      // elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                child: Text(
                  'Save Address',
                  style: AppTextstyle.withColor(
                    AppTextstyle.buttonMedium,
                    Colors.white,
                  ),
                ), // Text // ElevatedButton
              ),
            ),
          ],
        ), // Column
      ), // Container
    );
  }
}
