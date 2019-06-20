import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget
{
  State<StatefulWidget> createState(){
    return WelcomePageState();
  }
}
class WelcomePageState extends State<WelcomePage> 
{
  @override
  Widget build(BuildContext context)
  {
    Widget splash;
    try{
    splash = new Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover)
      ),
      child: new Column(
        children: _container(),
      ),
    );
    }catch(e){
      splash = Center(
        child: new CircularProgressIndicator()
      );
      print(e.toString());
    }
    return new Scaffold(
      body: splash,
    );
  }
  List<Widget> _container(){
    final Widget imageCircle = 
      Center(
        child: Padding(
          padding: EdgeInsets.only(
            top:120.0
          ),
          child:CircleAvatar(
            backgroundImage: AssetImage(
              "assets/marvel.jpg"
            ),
            radius: 50.0
          )
        )
      );
    final Widget companyText1 = 
      Center(
          child:Padding(
            padding: EdgeInsets.only(
              top:110
            ),
            child:new Text(
              "ColibriSoft",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.orange[900],
                fontFamily: "DellmonteSans"
            )
          )
        )
      );
    final Widget companyText2 = new Center(
        child: Text(
          "Service App",
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      );
      final Widget companyText3 = 
        Text(
          "Material and Robust Software developers",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        );
      final regButton = Padding(
          padding: EdgeInsets.only(
            top: 20
          ),
          child: RaisedButton(
            onPressed: (){
              print("Handle click!");
              Navigator.of(context).pushNamed("/register");
            },
            child: Text(
              "Explore our Services",
              style: TextStyle(
                fontFamily: "DellmonteSans"
              )
            ),
            splashColor: Colors.orange[900],
          )
        );
    return [
      imageCircle,
      companyText1,
      companyText2,
      companyText3,
      regButton
    ];
  }  
}