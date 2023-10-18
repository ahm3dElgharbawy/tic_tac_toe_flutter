import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation rightToLeftAnimation;
  late Animation fadeAnimation;
  @override
  void initState() {
    super.initState();
    initializeAnimations();
    startSplash();
  }

  initializeAnimations() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: 80.0, end: 0.0).animate(controller);
    rightToLeftAnimation = Tween(begin: 80.0, end: 0.0).animate(controller);
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  startSplash() async {
    await Future.delayed(const Duration(seconds: 4));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: const HomePage(),
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.fade,
        ),
      );
    }
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Transform.translate(
              offset: Offset(0, animation.value * -1),
              child: Image.asset(
                "assets/images/palestine.png",
                width: 170,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: rightToLeftAnimation,
            builder: (context, child) => Transform.translate(
              offset: Offset(rightToLeftAnimation.value, 0),
              child: Opacity(
                opacity: fadeAnimation.value,
                child: const Text("STANDING\nWITH\nPALESTINE",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
