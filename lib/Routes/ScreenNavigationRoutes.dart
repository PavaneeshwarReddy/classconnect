import 'package:classconnect/Screens/HomeScreen.dart';
import 'package:classconnect/Screens/LoginAndRegisterScreen.dart';
import 'package:classconnect/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class screenNavigationRoutes {
  static final allRoutes = [
    GetPage(name: "/welcomescreen", page: ()=>const WelcomeScreen()),
    GetPage(name: "/loginregisterscreen", page: ()=>const LoginAndRegisterScreen(),transition: Transition.rightToLeftWithFade,),
    GetPage(name: "/homescreen", page: ()=>const HomeScreen(),transition: Transition.noTransition,),
  ];
}