import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();

  late String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(now);

    late String formattedDate2 = DateFormat("'Date : 'dd/MM/yyyy").format(now);
   Future<List<String>> getSavedTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('tasks_list') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    

    return  Scaffold(
      appBar: AppBar(),
      body:  SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(height: 11.h,),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700,color: Colors.black),
              ),
                SizedBox(height: 11.h,),
          
              Text(
                formattedDate,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,color: Color(0xff090A0A)),
              ),
                SizedBox(height: 32.h,),
                Center(child: Text("Recent Tasks",
                style: TextStyle(color: Color(0xff414141),fontSize: 24.sp,fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,)),
                SizedBox(height: 21.h,),
           Expanded(
             child: FutureBuilder<List<String>>(
               future: getSavedTasks(),
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return const Center(child: CircularProgressIndicator());
                 }
             
                 if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                   List<String> allTasks = snapshot.data!;
             
                   return ListView.builder(
                     itemCount: allTasks.length,
                     physics: const BouncingScrollPhysics(),
                     itemBuilder: (context, index) {
                       List<String> taskDetails = allTasks[index].split('||');
                       String title = taskDetails[0];
                       String date = taskDetails[1];
                       String description = taskDetails.length > 2 ? taskDetails[2] : "";
             
                       return Container(
                         margin: EdgeInsets.only(bottom: 15.h), 
                         width: double.infinity,
                         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                         decoration: BoxDecoration(
                           color: const Color(0xffEAEAEA),
                           borderRadius: BorderRadius.circular(8.r),
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               title,
                               style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0), fontSize: 18.sp, fontWeight: FontWeight.w700),
                             ),
                             SizedBox(height: 4.h),
                             Text(
                               description.isEmpty ? "No Description Provided" : description,
                               style: TextStyle(color: const Color(0xff65676B), fontSize: 14.sp, fontWeight: FontWeight.w400),
                             ),
                             SizedBox(height: 13.h),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       "Date : $date",
                                       style: TextStyle(color: const Color(0xff65676B), fontSize: 12.sp, fontWeight: FontWeight.w400),
                                     ),
                                     SizedBox(height: 2.h),
                                     Text(
                                       "Time : 15:25",
                                       style: TextStyle(color: const Color(0xff65676B), fontSize: 12.sp, fontWeight: FontWeight.w400),
                                     )
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Icon(Icons.star, size: 19.sp, color: const Color(0xff969696)),
                                     SizedBox(width: 3.w),
                                     Icon(Icons.delete, size: 19.sp, color: const Color(0xff969696)),
                                   ],
                                 )
                               ],
                             )
                           ],
                         ),
                       );
                     },
                   );
                 }
             
                 return Center(
                   child: Text(
                     "No tasks saved yet!",
                     style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                   ),
                 );
               },
             ),
           ),
          
          
          
                // Container(
                  
                //   height: 122.h,
                //   width: double.infinity,
                //   padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                //   decoration: BoxDecoration(
                //     color: Color(0xffEAEAEA),
                //     borderRadius: BorderRadius.circular(8.r),
                    
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo con",
                //       style: TextStyle(color: Color(0xff65676B),fontSize: 16.sp
                //       ,fontWeight: FontWeight.w400),),
                //       SizedBox(height: 13.h,),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                          
                //             children: [
                //                Text("Date : 23/12/2024",style: TextStyle(color: Color(0xff65676B),fontSize: 12.sp
                //           ,fontWeight: FontWeight.w400),),
                //           SizedBox(height: 2.h,),
                //           Text("Time : 15:25",style: TextStyle(color: Color(0xff65676B),fontSize: 12.sp
                //           ,fontWeight: FontWeight.w400),)
                          
                //           ],),
                //         Row(
                //           children: [
                //             Icon(Icons.star,size: 19.sp,color: Color(0xff969696),),
                //             SizedBox(width: 3.w,),
                //          Icon(Icons.delete,size: 19.sp,color: Color(0xff969696),),
          
                //           ],
                //         )
                //         ],
                //       )
                     
                //     ],
                //   ),
                // ),
                // SizedBox(height: 21.h,),
                // Container(
                  
                //   height: 122.h,
                //   width: double.infinity,
                //   padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                //   decoration: BoxDecoration(
                //     color: Color(0xffEAEAEA),
                //     borderRadius: BorderRadius.circular(8.r),
                    
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo con",
                //       style: TextStyle(color: Color(0xff65676B),fontSize: 16.sp
                //       ,fontWeight: FontWeight.w400),),
                //       SizedBox(height: 13.h,),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                          
                //             children: [
                //                Text("Date : 23/12/2024",style: TextStyle(color: Color(0xff65676B),fontSize: 12.sp
                //           ,fontWeight: FontWeight.w400),),
                //           SizedBox(height: 2.h,),
                //           Text("Time : 15:25",style: TextStyle(color: Color(0xff65676B),fontSize: 12.sp
                //           ,fontWeight: FontWeight.w400),)
                          
                //           ],),
                //         Row(
                //           children: [
                //             Icon(Icons.star,size: 19.sp,color: Color(0xff969696),),
                //             SizedBox(width: 3.w,),
                //          Icon(Icons.delete,size: 19.sp,color: Color(0xff969696),),
          
                //           ],
                //         )
                //         ],
                //       )
                     
                //     ],
                //   ),
                // ),
          
            ]
          ),
        )
      ),
    );
  }
}












