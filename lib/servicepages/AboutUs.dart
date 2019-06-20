import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return AboutUsPageState();
  }
}

class AboutUsPageState extends State<AboutUsPage>
{
  
  @override
  Widget build(BuildContext context)
  {
    Widget card =  Container(
      width: MediaQuery.of(context).size.width,
      child:Card(
    margin: EdgeInsets.only(left: 7,right: 7),    
    child: new Column(
      children: [
        Padding(padding: EdgeInsets.all(15),child:CircleAvatar(backgroundImage: AssetImage("assets/marvel.jpg"),radius: 40,)),
        Text("John Vector"),
        Container(
          padding:EdgeInsets.all(20),
          child:Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
          sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
          Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi 
          ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit 
          in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
          Excepteur sint occaecat cupidatat non proident, 
          sunt in culpa qui officia deserunt mollit anim id est laborum.""")
        )
      ] 
    ),
    )
  );
    return Scaffold(
      appBar: new AppBar(title: Text("About Us"),backgroundColor: Colors.indigo[600],),
      body: SingleChildScrollView(
              child:Container(child:Column(children: [
                Container(alignment: 
                  Alignment.center,
                  margin: EdgeInsets.only(top: 20,bottom:20),
                  child: Text(
                    "Our Services",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 22
                    )
                  )
                ),
              Row(
                children: [
                    new Expanded(flex:1,
                      child: Container(
                        //margin: EdgeInsets.only(left: 5),
                        //decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                        child: Card(
                          child:Text(
                        """Branding 1\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit""",
                        style: TextStyle(fontSize: 16),
                        )
                        )
                      )
                    ),
                    new Expanded(flex:1,
                      child: Container(
                        //margin: EdgeInsets.only(left: 5),
                        //decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                        child: Card(
                          child:Text(
                        """Branding 2\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit""",
                        style: TextStyle(fontSize: 16),
                        )
                        )
                      )
                    ),
                    new Expanded(flex:1,
                      child: Container(
                        //margin: EdgeInsets.only(left: 5,right:5),
                        //decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                        child: Card(
                          child:Text(
                        """Branding 3\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit""",
                        style: TextStyle(fontSize: 16),
                        )
                        )
                      )
                    ),
                    new Expanded(flex:1,
                      child: Container(
                        //margin: EdgeInsets.only(right:5),
                        //decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                        child:Card(
                          child:Text(
                        """Branding 4\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit""",
                        style: TextStyle(fontSize: 16),
                        )
                        )
                      )
                      ),
                ],
              ),
              SizedBox(height: 50,child:Align(alignment: Alignment.center,child: Text("Developers",style: TextStyle(color: Colors.blue[800],fontSize: 22),))),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: [ card,card,card]))
          ],
        )
      )
      )
    );
  }
}
