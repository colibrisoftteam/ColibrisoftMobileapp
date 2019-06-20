import 'package:flutter/material.dart';

class WebServices extends StatefulWidget
{
  @override
  State<StatefulWidget> createState(){
    return WebServicesState();
  }
}

class WebServicesState extends State<WebServices>
{
  Widget cards(BuildContext ctx)
  {
    Widget card = GestureDetector(
        onTap: (){
        print('selected');  
        },
        child: Stack(
          children: [
            Positioned(
              top: 10.0,
              child: Text("Text1"),
            ),
          ],
        ),
      );
    
      
    return (
      card
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return (
      Scaffold(appBar: AppBar(title: Text("Web Services")),body:cards(context))
    );
  }
}