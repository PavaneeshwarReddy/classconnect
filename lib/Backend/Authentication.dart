import 'package:classconnect/Backend/MongoDB.dart';
import 'package:classconnect/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mongo_dart/mongo_dart.dart';



class Authentication {

  static  loginUser(String username, String password) async {

    try{
      var authenticationCollection = mongoDatabase.collection('userdetails');
      var userDetails = await authenticationCollection.findOne({'username': username});

      if (userDetails != null) {

        if(userDetails["password"]==password) {
          //navigate to homescreen
          return {
            "userexist":true,
            "passwordmatch":true,
            "other":false
          };

        }
        else{
          //wrong password error enables border red color
          return {
            "userexist":true,
            "passwordmatch":false,
            "other":false
          };
          print("Wrong password");
        }
        return true;
      } else {
        //both username and password error enbles border
        return {
          "userexist":false,
          "passwordmatch":false,
          "other":false,
        };

      }
    }catch(error) {
      return {
        "userexist":false,
        "passwordmatch":false,
        "other":true,
      };
    }


  }
  static registerUser(String username,String password,String jobTitle) async{
   try{
     var authenticationCollection = mongoDatabase.collection("userdetails");
     var userDetails =await authenticationCollection.findOne({"username":username});
     if(userDetails!=null) {
       return {
         "userexist":true,
         "others":false,
       };
     }
     else{
       var newUserDetails = await authenticationCollection.insert({
         "username" :username,
         "password":password,
         "jobtitle":jobTitle
       });
       if(newUserDetails!=null) {
         return {
           "userexist":false,
           "others":false
         };
       }
     }
     return true;
   }catch(error) {
    return {
      "userexist":false,
      "others":true
    };
   }
   }
}

