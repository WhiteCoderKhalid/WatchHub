import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/editProfile/widgets/profileForm_screen.dart';
import 'package:watch_app/features/editProfile/widgets/profileImage.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ), // IconButton
      title: Text(
        'Edit Profile',
        style: AppTextstyle.withColor(
          AppTextstyle.h3,
          isDark ? Colors.white : Colors.black,
        ),
      ), // Text
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          ProfileImage(),
          SizedBox(height: 24),
          ProfileForm()
        ],
      ),
    ), // AppBar
  );// Scaffold

  }
}