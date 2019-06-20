import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'web_category.dart';
class Categories extends StatelessWidget{
  static List<String> titles = ["WEB","Mobile Apps","Telegram Bots","SMM/SEO","Business Automatisation"];
  static List<String> images = ["assets/webbg.jpg","assets/mobileapp.jpg","assets/telegrambot.png","assets/seo.png","assets/business.jpeg"];
  Widget serviceCard(BuildContext context){
    //   Widget item = SizedBox(
    //   height: 150,
    //   child:GestureDetector(
    //     onTap:(){
    //       Navigator.of(context).pushNamed("/web_category");
    //     },
    //   child:Card(
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     semanticContainer: true,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(topRight:Radius.circular(25.0),topLeft:Radius.circular(25.0),bottomRight:Radius.circular(25.0)),
    //       side: BorderSide(color: Colors.teal)
    //     ),
    //     borderOnForeground: true,
    //     child: 
    //         Container(child: Center(child:Text(title,style: TextStyle(fontSize: 18.0,color: Colors.black))),decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image),fit:BoxFit.fitWidth)),
    //     )
    // )
    //   )
    // );
    // return item;
    Widget tabBar = DefaultTabController(
      initialIndex: 0,
      length:5,
      child: new Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
          backgroundColor: Colors.teal,
          bottom:TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.brown,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          indicator: new BubbleTabIndicator(
          indicatorHeight: 25.0,
          indicatorColor: Colors.transparent,
          tabBarIndicatorSize: TabBarIndicatorSize.tab
        ),
        tabs: [
        Tab(text: "WEB"),
        Tab(text:"Mobile Apps"),
        Tab(text: "Bots"),
        Tab(text: "SEO/SMM"),
        Tab(text: "Automatisation"),
      ],
    )
    )
    ),
    body: TabBarView(
      children: [
        Web_Category(),
        Text("Tab 2"),
        Text("Tab 3"),
        Text("Tab 4"),
        Text("Tab 5"),
      ],
    ),
    )
    );

  return tabBar;
  }
  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
       child: serviceCard(context),
    );
  }
}