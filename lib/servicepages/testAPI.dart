import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

Post postFromJson(String str){
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data){
  final dyn = data.toJson();
  return json.encode(dyn);
}
List<Post> allPostsFromJson(String str){
  final jsonData = json.decode(str);
  return new List<Post>.from(jsonData.map((x)=>Post.fromJson(x)));
}

String allPostsToJson(List<Post> data){
  final dyn = new List<dynamic>.from(data.map((x)=>x.toJson()));
  return json.encode(dyn);
}

class Post
{
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId,this.id,@required this.title,@required this.body});
  
  factory Post.fromJson(Map<String,dynamic> json)=> new Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"]
    );

    Map<String,dynamic> toJson() =>{
      "userId": userId,
      "id": id,
      "title": title,
      "body":body
    };
}

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List<Post>> getAllPosts() async{
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<Post> getPost() async {
  final response = await http.get('$url/1');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Post post) async{
  final response = await http.post('$url',
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: ''
    },
    body: postToJson(post)
  );
  return response;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Home()
    );
  }
}

class Home extends StatelessWidget{

  callAPI(){
    Post post = Post(
      body: 'Testing body body body',
      title: 'Flutter jam6'
    );
    createPost(post).then((response){
        if(response.statusCode > 200)
        print(response.body);
        else
          print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body : FutureBuilder<Post>(
            future: getPost(),
            builder: (context, snapshot) {
                callAPI();
              if(snapshot.connectionState == ConnectionState.done) {

                if(snapshot.hasError){
                  return Text("Error");
                }

                return Text('Title from Post JSON : ${snapshot.data.title}');

              }
              else
                return CircularProgressIndicator();
            }
        ) 
    );
  }

}