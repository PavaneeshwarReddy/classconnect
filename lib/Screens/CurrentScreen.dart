import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/colors.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({Key? key}) : super(key: key);

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: color1),),
        backgroundColor: color2,
        automaticallyImplyLeading: false,

        actions: [
          Padding(padding: EdgeInsets.only(right: 10.w),child: Icon(Icons.help),)
        ],
        
      ),
      body:  SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

      Center(child: Image.asset("lib/Images/empty.png")),
          Text("No current running connects...",style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),),
    );
  }
}
