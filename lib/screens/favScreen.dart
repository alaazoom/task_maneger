import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Padding(
        padding:  EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("Priority Tasks",style: TextStyle(
                color: Color(0xff414141),fontWeight: FontWeight.bold,fontSize: 24.sp
              ),),
            ),
            SizedBox(height: 21.h,),
              Container(
                      
                      height: 122.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Color(0xffEAEAEA).withOpacity(.3),
                        borderRadius: BorderRadius.circular(8.r),
                        
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo con",
                          style: TextStyle(color: Color(0xff65676B),fontSize: 16.sp
                          ,fontWeight: FontWeight.w400),),
                          SizedBox(height: 13.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                                children: [
                                   Text("Date : 23/12/2024",style: TextStyle(color: Color(0xff65676B),fontSize: 12.sp
                              ,fontWeight: FontWeight.w400),),
                              SizedBox(height: 2.h,),
                              Text("Time : 15:25",style: TextStyle(color: Color(0xff65676B),fontSize: 12.sp
                              ,fontWeight: FontWeight.w400),)
                              
                              ],),
                            Row(
                              children: [
                                Icon(Icons.star_border_outlined,size: 24.sp,color: Colors.yellow),
                                SizedBox(width: 3.w,),
                             Icon(Icons.delete,size: 19.sp,color: Color(0xff969696),),
              
                              ],
                            )
                            ],
                          )
                         
                        ],
                      ),
                    ),
        
          ],
        ),
      )
    );
  }
}