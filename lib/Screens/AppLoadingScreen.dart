import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppLoadingScreen extends StatefulWidget {
  const AppLoadingScreen({Key? key}) : super(key: key);

  @override
  State<AppLoadingScreen> createState() => _AppLoadingScreenState();
}

class _AppLoadingScreenState extends State<AppLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [

            Positioned(left: 0,top: 0,child:Image.asset("lib/Images/loading.gif",width: 50,) ),

            Positioned(left: -20,top: 100,child:Image.asset("lib/Images/logo.png",width: 400,) ),

            Positioned(
              bottom: 0
              ,child: Image.asset("lib/Images/appLoadingScreen.gif",width: 400.w,),),
            Center(
              child: Text("Hold on tight, we are setting up everthing for you"),
            ),
          ]
      ),
    ));
  }
}
