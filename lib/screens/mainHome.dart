import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tm/screens/addTask.dart';
import 'package:tm/screens/favScreen.dart';
import 'package:tm/screens/home.dart';

class MainHome extends StatefulWidget {
   MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<Widget> screens = [
    HomeScreen(),
    AddNoteScreen(),
    FavouriteScreen()

  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[index],
  
            bottomNavigationBar: Container(
      height: 60.h,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         InkWell(
           onTap: () {
             setState(() {
               index = 0;
             });
           },
           child: Icon(
                   Icons.home_outlined,
  color: index == 0 ? Color(0xff0866FF) : Color(0xff979C9E),
                     size: 24.sp,
                 ),
         ),
         InkWell(
           onTap: () {
             setState(() {
               index = 1;
             });
           },
           child: Icon(
                   Icons.add,
                   color: index == 1 ? Color(0xff0866FF) : Color(0xff979C9E),
                   size: 28.sp,
                 ),
         ),
         InkWell(
           onTap: () {
             setState(() {
               index = 2;
             });
           },
           child: Icon(
                   Icons.star_border_outlined,
  color: index == 2 ? Color(0xff0866FF) : Color(0xff979C9E),
                     size: 24.sp,
                 ),
         ),
      
        ],
      ),
    ),

    );
  }
}