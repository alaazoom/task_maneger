

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm/screens/home.dart';

class onBoardingScreens extends StatefulWidget {
  const onBoardingScreens({super.key});

  @override
  State<onBoardingScreens> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<onBoardingScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "images/onboard1.png", // استبدلها بمسار صورك
      "title": "Welcome to TaskPivot!",
      "description": "Start your journey towards enhanced productivity with TaskPivot! Our intuitive task management app helps you stay organized and focused."
    },
    {
      "image": "images/onboard2.png",
      "title": "Effortless Management",
      "description": "Say goodbye to overwhelming to-do lists and hello to effortless task management! With TaskPivot, you can easily add, prioritize, and track your tasks with just a few taps."
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
            },
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.black.withOpacity(.8), fontSize: 20.sp),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
                        Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.all(15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _onboardingData[index]["image"]!,
                          height: 220.h,
                          width: 330.w,
                        ),
                         SizedBox(height: 77.h),
                        Text(
                          _onboardingData[index]["title"]!,
                          style:  TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _onboardingData[index]["description"]!,
                          style:  TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black.withOpacity(.55),
                          fontWeight: FontWeight.w500,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      _onboardingData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),

                  SizedBox(
                    height: 45.h,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage == _onboardingData.length - 1) {
                             Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false);
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          
                          backgroundColor: Color(0xff0866FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2000000000000),
                          ),
                        ),
                        child:Center(child: Icon(Icons.arrow_forward, size: 24.sp, color: Colors.white,)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: _currentPage == index ? 32.w : 8.w, 
      decoration: BoxDecoration(
        color: _currentPage == index ? Color(0xff0866FF) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}