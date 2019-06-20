import 'package:flutter/material.dart';
import 'package:serviceapp/pages/Categories.dart';
import 'package:serviceapp/pages/SettingsPage.dart';
import 'package:serviceapp/pages/Notes.dart';
class HomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
{
  int _selectedindex = 0;
  static  List<Widget> _widgets = [
      HomeSide(),
      Categories(),
      SettingsPage()
  ];
  void onItemTapped(int index){
    setState(() {
          this._selectedindex = index;
    });
  }
  Widget appBarAndroid(BuildContext context)
  {
    /*Widget appBar = new Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,centerTitle: true,title: new Text('Services'),actions: [ new IconButton(icon: Icon(Icons.search),onPressed: (){ print("pressed");},)],),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundImage: AssetImage('assets/marvel.jpg'),radius: 40.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ 
                  Text('Services',style: TextStyle(color: Colors.white,fontSize: 25.0,),),
                    ]),
                ]
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
                gradient: LinearGradient(begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                stops: [0.1,0.5,0.7,0.9],
                colors: [
                  Colors.blue[200],
                  Colors.blue[300],
                  Colors.blue[600],
                  Colors.blue[700],
                ]
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home),title: Text("Home")),
            ListTile(leading: Icon(Icons.people_outline),title: Text("About Us")),
            Divider(height: 16.0,color: Colors.black45),
            ListTile(leading:Icon(Icons.web),title: Text("WEB")),
            ListTile(leading:Icon(Icons.mobile_screen_share),title: Text("Mobile Apps")),
            ListTile(leading:Icon(Icons.android),title: Text("Telegram Bots")),
            ListTile(leading:Icon(Icons.stars),title: Text("SMM/SEO")),
            ListTile(leading:Icon(Icons.monetization_on),title: Text("Business Automatisation")),
            Divider(height: 16.0,color: Colors.black45),
            ListTile(leading:Icon(Icons.settings),title: Text("Settings")),
            ListTile(leading: Icon(Icons.help),title: Text("Help"))
          ],
        ),
      ),
      body: Categories.Items(context),
      );*/
     // return appBar;
  }
  
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[500],centerTitle: false,title: new Text('Services'),
        actions: [ new IconButton(icon: Icon(Icons.search),
        onPressed: (){ print("pressed");})]),
        body: Center(child: _widgets.elementAt(this._selectedindex)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white70,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.list),title: Text("Categories")),
            BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text("Settings")),
          ],
          currentIndex: _selectedindex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.teal[500],
          onTap: onItemTapped,
        ),
    );
  }
}