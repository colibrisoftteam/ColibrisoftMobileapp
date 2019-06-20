import 'package:flutter/material.dart';
class HomeSide extends StatefulWidget
{
State<StatefulWidget> createState()
  {
    return HomeSideState();
  }
}

class HomeSideState extends State<HomeSide>
{
  String notes = " ";
  int index = 0;
  final myController = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    Widget devCard = Card(
        margin: const EdgeInsets.only(left: 20.0,top:15.0),
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0,left: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child:Text("Temur",style: TextStyle(fontSize: 20.0),)),
                Text("Flutter developer 2+ years experience...",style: TextStyle(fontSize: 14.0))
              ],
            ),
          ),
        )
      );
  Widget circleImg =  Positioned(
        top: .0,
        left: .0,
        bottom: .0,
        child: Center(
          child: CircleAvatar(
            radius: 30.0,
            child: Icon(Icons.accessibility),
          ),
        ),
      );
    Widget widgets = Stack(
    children: [
      devCard,
      circleImg,
    ],
  );
    List cardlist = List.generate(1,(index)=>{
        widgets
    });

  // Widget CardList = GridView.custom(
  //   gridDelegate: GridView.custom(
  //     childrenDelegate: ,
  //   ),
  // )


    return  Scaffold(
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context,int i){
            cardlist.map((val)=>new Container(child: val,)).toList();
          },
        )
      );
  }
}