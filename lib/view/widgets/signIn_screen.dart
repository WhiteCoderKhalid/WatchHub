import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/auth_controller.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/forgetpassword_screen.dart';
import 'package:watch_app/view/widgets/signUp_screen.dart';
import 'package:watch_app/view/widgets/custom_textfield.dart';
import 'package:watch_app/view/widgets/main_screen.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // appBar: AppBar(title: const Text("Welcome to sign in screen")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back!",
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Sign in To continue shopping",
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 8),
              //emailtextfield
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
              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.to(() => ForgetPasswordScreen()),
                  child: Text(
                    "Forgot password",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              //Sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // sign up button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Dont have an Account",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: Text(
                      "Sign Up",
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
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

  void _handleSignIn() async {
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
      const Center(child: CircularProgressIndicator()), // Center
      barrierDismissible: false,
    );

    try {
      final result = await authController.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
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

// void _handleSignIn() {
//   final AuthController authController = Get.find<AuthController>();
//    authController.login();
//   Get.offAll(() =>  MainScreen());
// }

// Sign In Button onPressed
