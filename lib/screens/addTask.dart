import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddNoteScreen extends StatefulWidget {
   AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
   final TextEditingController _dateController = TextEditingController(
  text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
);

TextEditingController _title = TextEditingController();

TextEditingController _des = TextEditingController();

Future<void> saveTask() async {
    final SharedPreferences task = await SharedPreferences.getInstance();

    List<String> currentTasks = task.getStringList('tasks_list') ?? [];

    String newTaskData = "${_title.text}||${_dateController.text}||${_des.text}";

    currentTasks.add(newTaskData);

    await task.setStringList('tasks_list', currentTasks);
  }


    @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(height: 8.h,),
              Center(
                child: Image.asset("images/add.png",height: 204.h,width: 225.29.w,fit: BoxFit.cover,)),
                SizedBox(height: 21.h,),
                TextField(
                   style: TextStyle(color: Color(0xff65676B),fontSize: 16.sp,fontWeight: FontWeight.w400),
          
                  controller: _title,
                  decoration: InputDecoration(
                    
                    labelText: "Title",
                    labelStyle: TextStyle(color: Color(0xff65676B),fontSize: 16.sp,fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                  ),
                ),
                
                SizedBox(height: 21.h,),
                TextField(
                   controller: _dateController,
                   readOnly: true,
                   style: TextStyle(color: Color(0xff65676B),fontSize: 16.sp,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    labelText: "Date",
                    labelStyle: TextStyle(color: Color(0xff65676B),fontSize: 16.sp,fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xffB9B9B9)),
                    ),
                  ),
                ),
                
                        SizedBox(height: 21.h,),
                SizedBox(
                  height: 122.h,
                  child: TextField(
                    controller: _des,
                     style: TextStyle(color: Color(0xff65676B),fontSize: 16.sp,fontWeight: FontWeight.w400),
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                      labelText: "Description (Optional)",
                      labelStyle: TextStyle(color: Color(0xff65676B),fontSize: 16.sp,fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Color(0xffB9B9B9)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Color(0xffB9B9B9)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Color(0xffB9B9B9)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Color(0xffB9B9B9)),
                      ),
                    ),
                  ),
                ),
                         SizedBox(height: 45.h,),
                         InkWell(
          onTap: () async{ await  saveTask();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
          top: 20.h, 
          bottom: MediaQuery.of(context).size.height - 200.h, 
          left: 50.w,
          right: 50.w, 
                ),
                
                backgroundColor: const Color(0xff0866FF), 
                elevation: 4,
                shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
                ),
              content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
            SizedBox(width: 8.w),
            Text(
          "Added",            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
                ),
                duration: const Duration(seconds: 2), 
              ),
            );
          }
          setState(() {
            _title.text = "";
            _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
            _des.text = "";
          });
          },
                           child: Container(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff0866FF),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                "Save Task",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),  ),
                         )
           
            ]
          ),
        ),
      )

    );
  }
}




