import 'package:flutter/material.dart';
import 'package:serviceapp/servicepages/welcome.dart';
import 'package:serviceapp/servicepages/registerpage.dart';
import 'package:serviceapp/servicepages/Homepage.dart';
import 'package:serviceapp/servicepages/Categories.dart';
import 'package:serviceapp/servicepages/detailspage.dart';
import 'package:serviceapp/servicepages/AboutUs.dart';

void main() => runApp(Start());


class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      title: '', 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "DellmonteSans",
        
        pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }
        )
      ),
      home: new WelcomePage(),
      routes: {
        "/register": (BuildContext context) => RegisterPage(),
        "/home": (BuildContext context) => HomePage(),
        "/categories": (BuildContext context) => Categories(),
        "/details": (BuildContext context) => DetailsPage(),
        "/aboutUs": (BuildContext context) => AboutUsPage()
      },
    );
  }
}
