import 'package:classconnect/Backend/creatingNewConnect.dart';
import 'package:classconnect/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SnackBar.dart';


class CreateRoomComponent extends StatefulWidget {
  const CreateRoomComponent({Key? key}) : super(key: key);

  @override
  State<CreateRoomComponent> createState() => _CreateRoomComponentState();
}

class _CreateRoomComponentState extends State<CreateRoomComponent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _time = TextEditingController();
  bool _isLoading=false;

  var handleResponseErrors={
    "name":false,
    "title":false,
    "time":false
  };
  var errorType=5;
  bool _openSnackBar=false;
  void controlSnackBar() {
    setState(() {
      _openSnackBar=!_openSnackBar;

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300.w,
      child: SingleChildScrollView(
        child:Form(
          child:  Column(
            children: [
              TextFormField(
                controller: _name,
                cursorColor: color1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["name"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["name"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["name"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Name to be displayed"
                ),
              ),
              SizedBox(height: 10.h,),
              TextFormField(
                cursorColor: color1,
                controller: _title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["title"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["title"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["title"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Purpose of connect"
                ),
              ),
              SizedBox(height: 10.h,),
              TextFormField(
                cursorColor: color1,
                controller: _time,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["time"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["time"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:handleResponseErrors["time"]==true?Colors.red:color1),borderRadius: BorderRadius.circular(15.w)),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Allow freely upto",
                    suffixIcon: Icon(Icons.timer,color: color3,)

                ),
              ),
              SizedBox(height: 10.h,),
              InkWell(
                onTap: () async {
                    if(_name.text.isEmpty || _time.text.isEmpty || _title.text.isEmpty) {
                            setState(() {
                              errorType=5;
                              _openSnackBar=true;
                              handleResponseErrors={
                                "name":_name.text.isEmpty?true:false,
                                "title":_title.text.isEmpty?true:false,
                                "time":_time.text.isEmpty?true:false
                              };
                            });
                            return;
                    }
                 setState(() {
                   _isLoading=true;
                 });
                  //var responseError = await CreateNewConnect.createNewConnect(_name.text, _title.text, int.parse(_time.text));
                    var responseError = await CreateNewConnect.joinConnect("name","7077", _name.text);
                    if(responseError) {
                      setState(() {
                        errorType=6;
                        _openSnackBar=true;
                      });
                    }
                    setState(() {
                      _isLoading=false;
                    });

                },
                child: Container(
                  width: 300.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color:_isLoading?Colors.white:color1,
                      borderRadius: BorderRadius.circular(15.w)
                  ),
                  child:_isLoading==false?const Center(child: Text("create new connect",style: TextStyle(color: Colors.white),),):Center(child: Image.asset("lib/Images/loading.gif",width: 50,),)
                ),
              ),
              _openSnackBar?Positioned(left:0,right:0,bottom: 0,child: CustomSnackBar.showSnackBar(errorType,controlSnackBar),):Container(),
            ],
          ),
        )
      )
    );
  }
}
