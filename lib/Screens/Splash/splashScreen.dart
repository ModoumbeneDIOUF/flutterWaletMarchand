import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nafa_money/Screens/Home/home.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
   
    super.initState();

    Timer(
      Duration(seconds: 5),
      ()=> Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
      )
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Image.asset("assets/images/nafa_splash.jpg",width: 40.w,)
          ],),
        ),
      ),
      
    );
  }
}