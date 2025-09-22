import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/auth_controller.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/custom_textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              //reset password
              Text(
                "Forget Pasword",
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter  Your Email  To Reset Password",
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),

              //email text field
              CustomTextfield(
                label: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Email ';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Please Enter A Valid Email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // onPressed: (){
                  //   showSuccesDialog(context);
                  // },
                  onPressed: _handleSendResetLink,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Send Reset Link",
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
    );
  }

  //handle send reset link

  void _handleSendResetLink() async {
    // validate input fields
    if (_emailController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (!GetUtils.isEmail(_emailController.text.trim())) {
      Get.snackbar(
        'Error',
        'Please enter a  valid email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    final AuthController authController = Get.find<AuthController>();

    // Show loading indicator
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final result = await authController.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      // Close loading no matter what
      Get.back();

      if (result.success) {
        showSuccesDialog(Get.context!);
      } else {
        Get.snackbar(
          'Error',
          result.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Close loading if error occurs
      Get.back();
      Get.snackbar(
        "Error",
        'An unexpected error occurred. Please try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // show success dialog
  void showSuccesDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text("Check Your Email", style: AppTextstyle.h3),
        content: Text(
          "We Have Sent Password Recovery Instruction To Your Email",
          style: AppTextstyle.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Ok",
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
