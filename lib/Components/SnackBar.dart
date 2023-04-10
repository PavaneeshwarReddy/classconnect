import 'package:classconnect/Utilities/SnackBarIcons.dart';
import 'package:classconnect/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utilities/SnackBarIcons.dart';


class CustomSnackBar {
    static Container showSnackBar(int errorType,Function controllSnackbar) {
      Map<int,Color>colorsMap = {
        1:color7,
        2:color6,
        3:color8,
        4:color9,
        5:color6,
        6:color6
      };
      Map<int,String>msgMap={
        1:userNotFoundMsg,
        2:isValidPassMsg,
        3:userExistMsg,
        4:successMsg,
        5:fieldEmptyMsg,
        6:internetConnectionMsg
      };
      Map<int,IconData>iconMap={
        1:userNotFoundIcon,
        2:isValidPassIcon,
        3:userExistIcon,
        4:successIcon,
        5:filedEmptyIcon,
        6:noInternetIcon
      };
      return Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: colorsMap[errorType]!),
          borderRadius: BorderRadius.circular(10.w),
            color: color2

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                  //Image.asset(iconMap[errorType]!,width: 30,),
                Icon(iconMap[errorType!]),
                  SizedBox(width: 10.w,),
                  Text(msgMap[errorType]!)
              ],
            ),

          GestureDetector(
            onTap: (){
                controllSnackbar();
            },
            child: Icon(Icons.close,size: 25.w,),
          )
          ],
        ));


    }

}