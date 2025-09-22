import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/custom_textfield.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ], // boxShadow
            ),
            child: CustomTextfield(
              label: "First Name",
              prefixIcon: Icons.person_outline,
              initialValue: "John", // 👈 works if no controller
            ),
          ),
          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CustomTextfield(
              label: "Email",
              prefixIcon: Icons.email_outlined,
              initialValue: "Alexjohnson@gamil.com",
            ),
          ),

          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CustomTextfield(
              label: "Phone Number",
              prefixIcon: Icons.phone_outlined,
              initialValue: "123456789",
              keyboardType: TextInputType.phone,
            ),
          ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Get.back();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                 padding: EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              ),
            child: Text(
              "Save Changes",
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                 Colors.white 
              ),
            )),
          )
        ],
      ),
    ); // Padding
  }
}
