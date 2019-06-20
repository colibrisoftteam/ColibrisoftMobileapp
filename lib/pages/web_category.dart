import 'package:flutter/material.dart';

class Web_Category extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return WebCategoryState();
  }
}
class MyItem {
  bool isExpanded;
  final String header ;
  final Widget body;
  MyItem(this.isExpanded,this.header,this.body);
}
class WebCategoryState extends State<Web_Category>
{
  bool isOrdering = false;
  List<String> web_categories = [
    "Landing Page","Online Store","SPA","Blog","Commercial Website","Individual website"
  ];
    @override
    Widget build(BuildContext context)
    {
      List list = new List.generate(1, (index)=> Center(child: new Column(
        children: [
          Text("Hello!"),
          RawMaterialButton(child: Text("Order Now!"),onPressed: (){
          },fillColor: Colors.white),
          ]
          )
          )
          );
          Widget scroll = NestedScrollView(
            headerSliverBuilder: (BuildContext context,bool innerBoxisScrolled){
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Landing Page"),
                    collapseMode: CollapseMode.pin,
                    background: Image.asset("assets/web.jpg",fit: BoxFit.fitWidth), 
                  ),
                ),
                
              ];
            },
            body: new Center(child: Text("About Landing Page")),
          );
      Widget expandableList = new ListView.builder(
        itemCount: 6,
        itemBuilder: (context,i)=>
          ExpansionTile(title: new Text(web_categories[i]),children: list.map((val)=>new Container(
            child: val,
          )
          ).toList())
      );
      return Container(
        child: new Scaffold(
        body: expandableList
      )
      );
    }
}
