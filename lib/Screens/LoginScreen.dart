import 'package:classconnect/Backend/Authentication.dart';
import 'package:classconnect/Components/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utilities/colors.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsecureText=true;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading=false;
  bool _openSnackBar=false;
  int errorType=1;
  var handleReponseErrors = {
    "userexist":true,
    "passwordmatch":true
  };

  void controlSnackBar() {
    setState(() {
      _openSnackBar=!_openSnackBar;

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(left:-70.w,top: 375.h,child: Image.asset("lib/Images/loginscreen.png",width: 600.w,height: 490.h,)),
            Container(
              margin: EdgeInsets.only(top: 180.h),
              width: double.infinity,
              height: double.infinity,
                child: Stack(

                  children:[

                    SingleChildScrollView(
                      child:Form(
                        key: _formKey,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text("Welcome back!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                            Center(child:Container(
                              width: 250.w,

                              margin: EdgeInsets.only(top: 10.h),
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                    cursorColor: color1,
                                    controller: _username,
                                    enableSuggestions: true,

                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(borderSide: BorderSide(color: handleReponseErrors["userexist"]==true?color1:Colors.red,),borderRadius: BorderRadius.circular(15.w)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:handleReponseErrors["userexist"]==true?color1:Colors.red,),borderRadius: BorderRadius.circular(15.w)),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:handleReponseErrors["userexist"]==true?color1:Colors.red,),borderRadius: BorderRadius.circular(15.w)),
                                      hintText: "username",

                                    )
                                ),
                              )
                            )),
                            Container(
                              width: 250.w,
                              height: 55.h,
                              margin: EdgeInsets.only(top: 10.h),
                              child: TextFormField(
                                  controller: _password,
                                  cursorColor: color1,
                                  obscureText: _obsecureText,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(borderSide: BorderSide(color: handleReponseErrors["passwordmatch"]==true?color1:Colors.red,),borderRadius: BorderRadius.circular(15.w)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:handleReponseErrors["passwordmatch"]==true?color1:Colors.red,),borderRadius: BorderRadius.circular(15.w)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:handleReponseErrors["passwordmatch"]==true?color1:Colors.red,),borderRadius: BorderRadius.circular(15.w)),
                                    hintText: "password",
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obsecureText = !_obsecureText; // Toggle the visibility of the password
                                        });
                                      },
                                      child: Icon(
                                        _obsecureText ? Icons.visibility_off : Icons.visibility,color: color4,
                                      ),
                                    ),

                                  )
                              ),

                            ),
                            InkWell(
                              onTap: ()async {

                                if(_username.text.length==0 || _password.text.length==0){
                                      setState(() {
                                        errorType=5;
                                        _openSnackBar=true;
                                        handleReponseErrors={
                                          "userexist" :_username.text.length==0?false:true,
                                          "passwordmatch":_password.text.length==0?false:true
                                        };

                                      });
                                      return;
                                }
                                setState(() {
                                  _isLoading=true;
                                });
                                var response = await Authentication.loginUser(_username.text, _password.text);
                                setState(() {
                                  handleReponseErrors = response;
                                  _isLoading=false;
                                  if(handleReponseErrors["userexist"]==false) {
                                    errorType=1;
                                    _openSnackBar=true;
                                  }
                                  else if(handleReponseErrors["passwordmatch"]==false) {
                                    errorType=2;
                                    _openSnackBar=true;
                                  }
                                  else{
                                    Get.toNamed("/homescreen");
                                  }

                                });
                              },
                              child: Container(
                                width: 250.w,
                                height: 55.h,
                                margin: EdgeInsets.only(top: 10.h),
                                decoration: BoxDecoration(
                                  color:_isLoading?Colors.white:color1,
                                  borderRadius: BorderRadius.circular(15.w),
                                ),
                                child:_isLoading?Center(child: Image.asset("lib/Images/loading.gif",width: 50,),):Center(child: Text("login",style: TextStyle(color: Colors.white),),),
                              ),
                            ),


                          ],
                        ),
                      )
                    ),
                    _openSnackBar?Positioned(left:0,right:0,bottom: 0,child: CustomSnackBar.showSnackBar(errorType,controlSnackBar),):Container(),

                  ]

                ),
              )



          ],
        ),
      )
    );
  }
}
