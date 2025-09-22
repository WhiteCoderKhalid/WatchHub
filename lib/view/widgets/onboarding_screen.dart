import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/auth_controller.dart';
import 'package:watch_app/utils/app_textstyle.dart';
import 'package:watch_app/view/widgets/signIn_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  final List<OnboardingItem> _items = [
    OnboardingItem(
      image: 'assets/images/intro.png',
      text: 'Discover latest Trends of Watches',
      description:
          'Explore the newest fashion Watch and find your uniques style',
    ),
    OnboardingItem(
      image: 'assets/images/intro1.png',
      text: 'Quality Watch',
      description:
          'Shop Premium Quality Watches from top Brand Around the World',
    ),
    OnboardingItem(
      image: 'assets/images/intro2.png',
      text: 'Easy Shopping',
      description: 'Simple And Secure Shoppinng At your Convienent',
    ),
  ];

  //handle get started logic

  void _handleGetStarted() {
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(() =>  SigninScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness;
    return Scaffold(
      // appBar: AppBar(title: const Text("Onboarding Screen")));
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    _items[index].text,
                    textAlign: TextAlign.center,
                    style: AppTextstyle.withColor(
                      AppTextstyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ), // margin here
                  height: 8,
                  width: currentPage == index
                      ? 24
                      : 8, //  width based on active index
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[700] : Colors.grey[300]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetStarted(),
                  child: Text(
                    "Skip",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      isDark ? Colors.grey[700]! : Colors.grey[500]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentPage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handleGetStarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    currentPage < _items.length - 1 ? 'Next' : "Get Started",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String text;
  final String description;

  OnboardingItem({
    required this.image,
    required this.text,
    required this.description,
  });
}
