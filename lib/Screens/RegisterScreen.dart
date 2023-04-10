import 'package:classconnect/Backend/Authentication.dart';
import 'package:classconnect/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obsecureText=true;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String _jobtitle = "student";
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(left:-110.w,top: 480.h,child: Image.asset("lib/Images/registerscreen.png",width: 600.w,height: 490.h,)),
              Container(
                  margin: EdgeInsets.only(top: 150.h),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        Text("Hi there!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                        Center(child:Container(
                          width: 250.w,
                          height: 55.h,
                          margin: EdgeInsets.only(top: 10.h),
                          child: TextFormField(
                            controller: _username,
                              cursorColor: color1,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color1,),borderRadius: BorderRadius.circular(15.w)),
                                  //enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: color1,),borderRadius: BorderRadius.circular(15.w)),
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "username",
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.w),
                                    borderSide: BorderSide(color: color5),
                                  )
                              )
                          ),
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
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color1,),borderRadius: BorderRadius.circular(15.w)),
                                  //enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: color1,),borderRadius: BorderRadius.circular(15.w)),
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
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: color5),
                                      borderRadius: BorderRadius.circular(15.w)
                                  )
                              )
                          ),

                        ),
                        Center(child:Container(
                          width: 250.w,
                          height: 55.h,
                          margin: EdgeInsets.only(top: 10.h),
                          child: DropdownButtonHideUnderline(
                            child: DropDown(
                              hint: Text("job-title"),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down),
                              items: [
                                "Tutor",
                                "Student",
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _jobtitle=value!;
                                });
                              },
                            ),
                          ),
                          padding: EdgeInsets.all(10.w),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.w)),
                            border: Border.all(color: color4),
                          ),

                        )),
                        InkWell(
                          onTap: () async{
                            setState(() {
                              _isLoading=true;
                            });
                           await  Authentication.registerUser(_username.text, _password.text, _jobtitle);
                           setState(() {
                             _isLoading=false;

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
                            child:_isLoading?Center(child: Image.asset("lib/Images/loading.gif",width: 50,),):Center(child: Text("register",style: TextStyle(color: Colors.white),),),
                          ),
                        )
                      ],
                    ),
                  )
              ),


            ],
          ),
        )
    );
  }
}
