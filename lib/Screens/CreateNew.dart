import 'package:classconnect/Components/CreateRoomComponent.dart';
import 'package:classconnect/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewScreen extends StatefulWidget {
  const CreateNewScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewScreen> createState() => _CreateNewScreenState();
}

class _CreateNewScreenState extends State<CreateNewScreen> {
  int selected=0;
  Radius borderRadiusContainers = Radius.circular(15.w);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create",style: TextStyle(color:color1),),
        backgroundColor:color2,
        automaticallyImplyLeading: false,
        actions: [
          Padding(padding: EdgeInsets.only(right: 10.w),child: Icon(Icons.help,color:color1,),)
        ],

      ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child:SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child:  Column(


                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150.w,
                            height: 150.w,

                            decoration: BoxDecoration(
                                color:selected==0 ?color2:color1,
                                borderRadius: BorderRadius.only(topLeft: borderRadiusContainers,bottomLeft: borderRadiusContainers)
                            ),
                          ),
                          Container(
                            width: 150.w,
                            height: 150.w,
                            decoration: BoxDecoration(
                                color:selected==1?color2:color1,
                                borderRadius: BorderRadius.only(topRight: borderRadiusContainers,bottomRight: borderRadiusContainers)
                            ),
                          )
                        ],
                      ),
                      Positioned(child: Image.asset("lib/Images/createnew.png",width: 363.w,height: 234.h,)),
                    ],
                  ),
                  SizedBox(height: 50.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              selected=0;
                            });
                          },
                          child: Container(
                            width: 150.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.w),bottomLeft: Radius.circular(15.w)),
                              color: selected==0?color2:color1,
                            ),
                            child: Center(child:Text("create",style: TextStyle(color: selected==0?color1:Colors.white),)),
                          )
                      ),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              selected=1;
                            });
                          },
                          child: Container(
                            width: 150.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15.w),bottomRight: Radius.circular(15.w)),
                              color: selected==1?color2:color1,
                            ),
                            child: Center(child:Text("join",style: TextStyle(color: selected==1?color1:Colors.white),)),
                          )
                      ),



                    ],

                  ),
                  SizedBox(height: 20.h,),
                  CreateRoomComponent()
                ],
              ),
            )
          )
        ),
    );
  }
}
