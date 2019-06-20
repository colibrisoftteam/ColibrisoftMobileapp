import 'package:flutter/material.dart';
import 'dart:async';

class SignUpPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return SignUpPageState();
  }
}
class FormRect extends CustomClipper<Rect>
{
  @override
  Rect getClip(Size size)
  {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width,size.height);
    return rect;
  }
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
      
    }
}
class SignUpPageState extends State<SignUpPage>
{
  String _name,password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      
      body: new Column(
        children: [ 
                Form(
                  
                  key: _formKey,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          
                          initialValue: null,
                          decoration: InputDecoration(labelText: 'Enter Name', hintText: 'Name',focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                          keyboardType: TextInputType.multiline,
                          cursorColor: Colors.black,
                          validator: (value){
                            if(value.isEmpty)
                            {
                              return 'Enter this field';
                            }
                          },
                          onSaved: (value){
                            this.setState(()=>this._name = value);
                          },
                          
                        ),
                        
                        TextFormField(
                          
                          initialValue: null,
                          decoration: InputDecoration(labelText: 'Phone Number', hintText: 'phone',focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          validator: (value){
                            if(value.isEmpty)
                            {
                              return 'Enter this field';
                            }
                          },
                          onSaved: (value){
                            this.setState(()=>this._name = value);
                          }
                          ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
                        child:RaisedButton(
                            onPressed: (){
                              if(this._formKey.currentState.validate())
                              {
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('OK!')));
                              }
                            },
                            child: Text('Submit'),
                        ))
                      ],
                      
                  ),
                  
                ),
          Text('Hello')
        ],
      ),
    );
  }
  
}