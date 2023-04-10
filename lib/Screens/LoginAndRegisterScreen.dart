import 'package:classconnect/Screens/LoginScreen.dart';
import 'package:classconnect/Screens/RegisterScreen.dart';
import 'package:classconnect/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Components/SnackBar.dart';

class LoginAndRegisterScreen extends StatefulWidget {
  const LoginAndRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginAndRegisterScreen> createState() => _LoginAndRegisterScreenState();
}

class _LoginAndRegisterScreenState extends State<LoginAndRegisterScreen> {
  List<String>labels=["Login","register"];
  Map<String,Color>mappingBackgroundColors = {
    "selected" :color2,
    "unselected":color1
  };
  int selected=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [

           Container(
           child:selected==0?LoginScreen():RegisterScreen()),
           Container(
                margin: EdgeInsets.only(top: 75.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=0;
                          });
                        },
                        child: Container(
                          width: 125.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.w),bottomLeft: Radius.circular(15.w)),
                            color: selected==0?color2:color1,
                          ),
                          child: Center(child:Text("login",style: TextStyle(color: selected==0?color1:Colors.white),)),
                        )
                    ),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=1;
                          });
                        },
                        child: Container(
                          width: 125.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15.w),bottomRight: Radius.circular(15.w)),
                            color: selected==1?color2:color1,
                          ),
                          child: Center(child:Text("register",style: TextStyle(color: selected==1?color1:Colors.white),)),
                        )
                    ),

                  ],
                ),
              ),


          ],
        ),
      )
    );
  }
}
