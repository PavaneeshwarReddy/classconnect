import 'package:avatar_glow/avatar_glow.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:classconnect/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            width: 838.w,
            height: 712.h,
            top: -290.h,
            left: -280.w,
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset("lib/Images/welcometop.png",fit:BoxFit.contain,),
            ),
          ),

          Positioned(
          top: 150.h,
          left: 30.w,

          child: Image.asset("lib/Images/welcomeLogo.png",width: 225.w,)),

          Positioned(bottom: -50.h,left: -30.w,child: Image.asset("lib/Images/welcome2.png",width: 500.w,height: 370.h,fit: BoxFit.cover,)),




          Center(
             child: AvatarGlow(

               endRadius: 120.h,
               repeat: true,
               glowColor: color5,

               duration: Duration(milliseconds: 3000),

                 child: Container(
                   width: 100.h,
                   height: 100.h,
                   decoration: BoxDecoration(
                       color: color1,
                       borderRadius: BorderRadius.circular(100.h)
                   ),
                   child: IconButton(
                     onPressed: (){
                       Get.toNamed("/loginregisterscreen");
                     },
                     icon: Icon(Icons.arrow_forward,size: 30.h,color: color2,),
                   ),
                 ),
               )
             ),
          


        ],
      ),
    );
  }
}
