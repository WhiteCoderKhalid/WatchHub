import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/auth_controller.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/custom_textfield.dart';
import 'package:watch_app/view/widgets/main_screen.dart';
import 'package:watch_app/view/widgets/signIn_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
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
              Text(
                "Create Account",
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Sign Up To Get Started ",
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),

              // full name text field
              CustomTextfield(
                label: "Name",
                prefixIcon: Icons.person_2_outlined,
                keyboardType: TextInputType.name,
                isPassword: true,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Name ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // email text field
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
              const SizedBox(height: 16),
              // password form field
              CustomTextfield(
                label: "Password",
                prefixIcon: Icons.lock_outlined,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // confirm password text field
              CustomTextfield(
                label: "Confirm password",
                prefixIcon: Icons.lock_outlined,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Confirm Your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Password Not Matching';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              //sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account",
                    style: AppTextstyle.withColor(
                      AppTextstyle.h3,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                      SizedBox(width: 4),
                  TextButton(
                    onPressed: () => Get.to(() => SigninScreen()),
                    child: Text(
                      "Sign In",
                      style: AppTextstyle.withColor(
                        AppTextstyle.h3,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignUp() async {
    if (_nameController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

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

    if (_passwordController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (_passwordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password must be at least 6 Character',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (_confirmPasswordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password do not match',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final AuthController authController = Get.find<AuthController>();
    // Show loading indicator
    Get.dialog(
      const Center(child: CircularProgressIndicator()), // Center
      barrierDismissible: false,
    );

    try {
      final result = await authController.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text.trim(),
      );

      // close loading dialog
      Get.back();

      if (result.success) {
        Get.snackbar(
          'Success',
          result.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Navigate to main screen after success
        Get.offAll(() => MainScreen());
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
      // Handle error
      Get.back();
      Get.snackbar(
        "Error",
        'An Unexpected error occured . Please Try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
