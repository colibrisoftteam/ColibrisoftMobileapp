import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage>
{
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    Widget registerPage;
    try{
      registerPage = Container(
        height: double.infinity,
        decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover)
            ),
            child: SingleChildScrollView(
              child: new Column(
                children: [
                  SizedBox(height: 150),
                    Text("Tell Us Who you are",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,fontFamily: "DellmonteSans"
                    )
                    ),
                 Form(
                    key: this._formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(bottom: 10),
                          child:Text(
                            "Your Name",
                            style: TextStyle(
                            color: Colors.white,
                            fontFamily: "DellmonteSans")
                          )
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.orange[900]
                            )
                          ),
                          width: 260,
                          child:TextFormField(
                            style: TextStyle(color: Colors.white,
                            fontFamily: "DellmonteSans"),
                            cursorColor: Colors.white,
                            decoration: InputDecoration( 
                              hintText: "John",
                              hintStyle: TextStyle(color: Colors.white,
                              fontFamily: "DellmonteSans"
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white
                                )
                              )
                            ),
                            validator: (value){
                              if(value.isEmpty)
                              {
                                return "This field is required";
                              }
                            },
                          )
                        ),
                        SizedBox(height: 20),
                        Text("Your Proffession",style: TextStyle(color: Colors.white,fontFamily: "DellmonteSans")),
                        SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.orange[900],
                                )
                              ),
                              width: 260,
                              child:TextFormField( 
                                
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white,fontFamily: "DellmonteSans"),
                                cursorRadius: Radius.circular(10.0),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white
                                    )
                                  ),
                                  hintText: "Businessman",
                                  hintStyle: TextStyle(
                                    color: Colors.white,fontFamily: "DellmonteSans"
                                  )
                                ),
                                validator: (value){
                                  if(value.isEmpty)
                                  {
                                    return "This field is required";
                                  }
                                },
                              )
                            ),
                            SizedBox(height: 15),
                            new GestureDetector(
                            child: RaisedButton(
                            onPressed: (){
                              if(_formkey.currentState.validate()){
                                  print("submited");
                                  
                                  Navigator.of(context).pushNamed('/home');
                                  
                              }else{
                                print("Error!");
                              }
                            },
                            splashColor: Colors.orange[900],
                            child: Text("Next",style: TextStyle(fontFamily: "DellmonteSans"),),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                          ),
                        )
                      ],
                    ),
                  )
                ]
            )
        )
      );
    return Scaffold(
      body: registerPage
    );
    }catch(e){
      registerPage = new Center(
        child: new CircularProgressIndicator()
      );
      print(e.toString());
    }
  }
}
