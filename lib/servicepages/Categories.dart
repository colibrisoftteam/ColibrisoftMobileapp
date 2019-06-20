import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Categories extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return CategoriesState();
  }
}

class CategoriesState extends State<Categories>
{
  
  @override
  Widget build(BuildContext context)
  {
    Widget allList;
    try{
    Widget categories = new GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed("/details");
      },
      child:Container(
        decoration: BoxDecoration(
        ),
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top:6,left:5,bottom: 6,right:5),
        child: new Column(
        children: [
          Align(alignment: Alignment.topLeft,child:Text("Landing Page",style: TextStyle(fontFamily: "DellmonteSans"),)),
          SizedBox(height:5),
          Align(alignment: Alignment.topLeft,child:Text("Commercial,Business,Social",style: TextStyle(fontFamily: "DellmonteSans"),)),
        ], 
      ),
      )
    );
    allList = new ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context,int i){
          return Stack(children: [
            new Card(
              child:Slidable(
              actionPane: SlidableStrechActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                color: Colors.white,
                child: categories
              ),  
              secondaryActions: [
                IconSlideAction(
                  caption: "Quick Info",
                  color: Colors.redAccent,
                  icon: Icons.info_outline,
                  onTap: (){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context)=> SimpleDialog(
                        contentPadding: EdgeInsets.all(15),
                        title: Text("About Landing Page"),
                        children: [
                          new Column(children: [
                              SizedBox(height:200.0,width: double.infinity,child: Stack(children: [
                                SingleChildScrollView(child:Text("""In online marketing, a landing page, sometimes known as a \"lead capture page\", \"static page\", or a \"destination page\", is a single web page that appears in response to clicking on a search engine optimized search result,
                                 marketing promotion, marketing email, or an online advertisement. The landing page will usually display directed sales copy that is a logical extension of the advertisement, search result or link. 
                                 """,style: TextStyle(wordSpacing: 2),),
                                ), 
                              ]))
                            ]),
                            new RawMaterialButton(
                              fillColor: Colors.indigo[600],
                              splashColor: Colors.indigoAccent,
                              child: Text("View Samples",style: TextStyle(color: Colors.white,fontFamily: "DellmonteSans"),),
                              onPressed: (){
                                print("Click!");
                              },
                            )
                        ],
                        )
                    );
                  },
                  ),
                  IconSlideAction(
                  caption: "Open",
                  color: Colors.blueAccent,
                  icon: Icons.exit_to_app,
                  onTap: (){ Navigator.of(context).pushNamed("/details");},
                ),
              ],
            ),
            ),
            Divider(color: Colors.black26,height: 1)
          ]);
        },
      );
    }catch(e){
      print(e.toString());
    }
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[600],
        title: Text("WEB",style: TextStyle(fontFamily: "DellmonteSans"),),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          Icon(Icons.sort)  
        ],
      ),
      body: allList
      );
  }
}

