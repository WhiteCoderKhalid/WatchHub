import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watch_app/controllers/auth_controller.dart';
import 'package:watch_app/controllers/theme_controller.dart';
import 'package:watch_app/firebase_options.dart';
import 'package:watch_app/utils/app_theme.dart';
import 'package:watch_app/view/splash_screen.dart';

void main() async{
 
 WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController =Get.find<ThemeController>();
    return GetMaterialApp(
      title: 'WAtch Hub',
      debugShowCheckedModeBanner: false,
      theme:AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
       home: SplashScreen()
    );
  }
}
