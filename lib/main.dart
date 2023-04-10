import 'package:classconnect/Backend/Authentication.dart';
import 'package:classconnect/Backend/MongoDB.dart';
import 'package:classconnect/Routes/ScreenNavigationRoutes.dart';
import 'package:classconnect/Screens/AppLoadingScreen.dart';
import 'package:classconnect/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isAppFirstTimeLoading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isAppFirstTimeLoading=true;
    connectToDataBase().then((value) {
      setState(() {
        _isAppFirstTimeLoading=false;
      });
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(375,812),
      builder: (context,child){
        return GetMaterialApp(

          theme: ThemeData(
              useMaterial3: true,
              textTheme: GoogleFonts.poppinsTextTheme()
          ),
          debugShowCheckedModeBanner: false,
          home: AnimatedSwitcher(duration: Duration(milliseconds: 1500),
            child: _isAppFirstTimeLoading==true?AppLoadingScreen():WelcomeScreen(),
          ),
          getPages: screenNavigationRoutes.allRoutes,
        );
      },
    );
  }
}



/*
*
*
* ScreenUtilInit(
      designSize:  Size(375,812),
     builder: (context,child){
        return GetMaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme()
          ),
          debugShowCheckedModeBanner: false,
          home: _isAppFirstTimeLoading==true?AppLoadingScreen():WelcomeScreen(),
          getPages: screenNavigationRoutes.allRoutes,
        );
     },
    );
*
* */