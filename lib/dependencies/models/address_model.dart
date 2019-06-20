
class Address{
  final String city;
  final List<String> street;
  
  Address({this.city,this.street});
  factory Address.fromJson(Map<String,dynamic> parsedJson){
    var streetsFromJson = parsedJson['streets'];
    List<String>  streetsList = streetsFromJson.cast<String>();
    return new Address(
      city: parsedJson['city'],
      street: streetsList,
    );
  }
  
}
