import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:classconnect/Screens/CreateNew.dart';
import 'package:classconnect/Screens/CurrentScreen.dart';
import 'package:classconnect/Screens/History.dart';
import 'package:classconnect/Screens/LoginScreen.dart';
import 'package:classconnect/Screens/Settings.dart';
import 'package:flutter/material.dart';

import '../Utilities/colors.dart';
import 'RegisterScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        bottomNavigationBar: AnimatedNotchBottomBar(
          showBlurBottomBar: false,
          showShadow: false,
          color: color1,
          onTap: (index){
            _pageController.jumpToPage(
              index,
            );
          },
          itemLabelStyle: const TextStyle(color: Colors.white),
          notchColor: color2,
          showLabel: true,
          bottomBarItems: const [
            BottomBarItem(inActiveItem: Icon(Icons.home,color: Colors.white,), activeItem: Icon(Icons.home),itemLabel: "Home"),
            BottomBarItem(inActiveItem: Icon(Icons.add,color:Colors.white), activeItem: Icon(Icons.add),itemLabel: "Create"),
            BottomBarItem(inActiveItem: Icon(Icons.history_edu,color:Colors.white), activeItem: Icon(Icons.history_edu),itemLabel: "History"),
            BottomBarItem(inActiveItem: Icon(Icons.settings,color:Colors.white), activeItem: Icon(Icons.settings),itemLabel: "Settings"),
          ],
          pageController: _pageController,
        ),
        backgroundColor: Colors.white,
        extendBody: true,
        body:PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),

          children: [
              CurrentScreen(),
              CreateNewScreen(),
              HistoryScreen(),
              SettingsScreen()
          ],
        )
    );
  }
}
