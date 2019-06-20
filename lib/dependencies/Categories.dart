import 'package:http/http.dart' as http;

class Categories {
  final String category;
  final String info;
  final String image;
  Categories(this.category,this.info,this.image);

  factory Categories.fromJson(Map<String,dynamic> json){
    json = json['results'][0];
    String category = json['category'];
    String info = json['info'];
    String image = json['image'];
    return Categories(category,info,image);
  }
}

// Future<Categories> getCategories() async{
//   final response = await http.get("https://randomuser.me/api/");
//   final responseJson = json.decode(response.body);
//   return Categories.fromJson(responseJson);
// }