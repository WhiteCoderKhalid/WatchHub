import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // Get current theme mode
  ThemeMode get theme => _loadTheme ? ThemeMode.dark : ThemeMode.light;
  bool get isDarkMode => _loadTheme;

  // Load theme from storage
  bool get _loadTheme => _box.read(_key) ?? false;

  // Save theme to storage
  void _saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  // Toggle between light and dark with a small transition delay
  void toggleTheme() {
    final newTheme = !_loadTheme;

    Future.delayed(const Duration(milliseconds: 300), () {
      Get.changeThemeMode(newTheme ? ThemeMode.dark : ThemeMode.light);
      _saveTheme(newTheme);
      update();
    });
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class ThemeController extends GetxController {
//   final _box = GetStorage();
//   final _key = 'isDarkMode';

//   // Get current theme mode
//   ThemeMode get theme => _loadTheme ? ThemeMode.dark : ThemeMode.light;
//   bool get isDarkMode => _loadTheme;

//   // Load theme from storage
//   bool get _loadTheme => _box.read(_key) ?? false;

//   // Save theme to storage
//   void _saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

//   // Toggle between light and dark
//   void toggleTheme() {
//     final newTheme = !_loadTheme;
//     Get.changeThemeMode(newTheme ? ThemeMode.dark : ThemeMode.light);
//     _saveTheme(newTheme);
//     update();
//   }
// }
