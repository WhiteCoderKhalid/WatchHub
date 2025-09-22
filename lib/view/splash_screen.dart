import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/controllers/auth_controller.dart';
import 'package:watch_app/view/widgets/main_screen.dart';
import 'package:watch_app/view/widgets/onboarding_Screen.dart';
import 'package:watch_app/view/widgets/signIn_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }
   
   void _initializeApp() async {
  // Wait for Firebase auth state to be determined
  await Future.delayed(const Duration(milliseconds: 2500));

  // Navigate based on auth state
  if (authController.isFirstTime) {
    Get.off(() => const OnboardingScreen());
  } else if (authController.isLoggedIn) {
    Get.off(() =>  MainScreen());
  } else {
    Get.off(() => SigninScreen());
  }
}

  @override
  Widget build(BuildContext context) {
    //navigate based on auth after 2.5seconds
    // Future.delayed(const Duration(milliseconds: 2500), () {
    //   if (authController.isFirstTime) {
    //     Get.off(() => const OnboardingScreen());
    //   } else if (authController.isLoggedIn) {
    //     Get.off(() =>  MainScreen());
    //   } else {
    //     Get.off(() =>  SigninScreen());
    //   }
    // });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor.withOpacity(0.6),
            ],
          ),
        ),
        child: Stack(
          children: [
            // background pattern
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: GridPattern(color: Colors.white),
              ),
            ),

            // Main logo & title at center
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1200),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      children: const [
                        Icon(
                          Icons.watch, // your logo
                          size: 80,
                          color: Colors.white,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "WATCH STORE",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Slogan at bottom with rolling animation
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: RollingText(
                  text: "Beyond Time⌚ Into Legacy.",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Rolling animated text widget
class RollingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  const RollingText({super.key, required this.text, required this.style});

  @override
  State<RollingText> createState() => _RollingTextState();
}

class _RollingTextState extends State<RollingText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0), // horizontal rolling
          child: child,
        );
      },
      child: Text(widget.text, style: widget.style),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Grid background
class GridPattern extends StatelessWidget {
  final Color color;
  const GridPattern({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: GridPainter(color: color));
  }
}

class GridPainter extends CustomPainter {
  final Color color;
  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;
    const spacing = 20.0;

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
