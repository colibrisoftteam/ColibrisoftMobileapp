import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState(){
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SplashScreen>
{
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration,navigationpage);
  }
  void navigationpage()
  {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState() {
      super.initState();
      startTime();
    }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image(image: AssetImage('assets/marvel.jpg')))
    );
  }
}