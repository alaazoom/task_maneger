import 'package:flutter/material.dart';
import 'package:tm/screens/onBoarding.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => onBoardingScreens()),
      (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: -200.0, end: 0.0),
          duration: const Duration(seconds:2),
          curve: Curves.easeOutBack, 
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, value), 
              child: child,
            );
          },
          child: Image.asset(
            "images/logo.png",
          ),
        ),
      ),
    );
  }
}