import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget
{
   @override
   State<StatefulWidget> createState()
   {
     return SettingsPageState();
   }
}

class SettingsPageState extends State<SettingsPage>
{
  List<String> infoList = ["Landing Page","Online Shop","Telegram Bots","Android apps","IOS Apps"];
Widget getPageWidget(String text,String image) {
  return Container(
    width: double.infinity,  //match parent
    height: double.infinity, //match parent
    child: ListView(
      children: [
      Image(image: AssetImage(image),alignment: Alignment.center,),
      Center(child:Text(text))
      ]
    )
  );
}

  @override
  Widget build(BuildContext context)
  {
     Widget bodyData() => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "General",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Colors.grey,
                      ),
                      title: Text("Language")
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.wifi,
                          color: Colors.amber,
                        ),
                        title: Text("Wifi"),
                        ),
                    ListTile(
                      leading: Icon(
                        Icons.bluetooth,
                        color: Colors.blue,
                      ),
                      title: Text("Bluetooth"),
                      
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                      title: Text("More"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),

              //3
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Sound",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.do_not_disturb_off,
                        color: Colors.orange,
                      ),
                      title: Text("Silent Mode"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.vibration,
                        color: Colors.purple,
                      ),
                      title: Text("Vibrate Mode"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.volume_up,
                        color: Colors.green,
                      ),
                      title: Text("Sound Volume"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phonelink_ring,
                        color: Colors.grey,
                      ),
                      title: Text("Ringtone"),
                      trailing: Icon(Icons.arrow_right),
                    )
                  ],
                ),
              ),
            ],
          ),
      );
    final Widget pageView = Container(
    width: double.infinity,  //match parent
    height: double.infinity,
    child: ListView.custom(
      childrenDelegate: 
      SliverChildListDelegate(List.generate(5,(index){
        return Container(
          child: Row(
            
            children: [
              ListTile(leading: Icon(Icons.web),title: Text(infoList[index]))
            ],
          ),
          );
      }
      )),
    )
  );
    return (bodyData());
  }

}