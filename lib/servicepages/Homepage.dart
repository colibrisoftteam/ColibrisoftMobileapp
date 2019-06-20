import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as english_words;

class HomePage extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return HomePageState();
  }
}
class HomePageState extends State<HomePage>
{
  
  List<String> titles = ["WEB","Mobile Apps","Telegram Bots","SMM/SEO","Business Automatisation"];
  List<String> images = ["assets/webbg.jpg","assets/mobileapp.jpg","assets/telegrambot.png","assets/seo.png","assets/business.jpeg"];
  List<String> xp = ["High","Medium","Medium","Medium","Good","Modest"];
  
  final List<String> kEnglishWords;
  _MySearchdelegate _delegate;
  HomePageState(): kEnglishWords = List.from(Set.from(english_words.all))
  ..sort(
    (w1,w2) => w1.toLowerCase().compareTo(w2.toLowerCase())
  ),
  super();

  @override
  void initState()
  {
    super.initState();
    _delegate = _MySearchdelegate(kEnglishWords);
  }
  Widget _items(BuildContext context,String titles,String images,String xp){
    Widget items = null;
    try{
     items = new GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed("/categories");
      },
        child: new Column( 
          
          children:[ 
            new Card(
              child: new Container(height: 180,width: double.infinity,child: new Center(child:Text(titles,style: TextStyle(fontFamily: "DellmonteSans",color: Colors.redAccent,fontSize: 18.0),)),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(images),fit: BoxFit.fitWidth)),
              ),
            )
          ]
        )
      );
    }catch(e){
      items = new Container(child: new CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            Colors.brown[800]
          )
        )
      );
      print(e.toString());
    }
    return items;
  }
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      drawer: Drawer(
        child:
        Container(
          color: Colors.indigo[600],
        child: ListView(
          padding: EdgeInsets.zero,
          children: listTiles(context)
        ),
        )
        ),
      appBar: new AppBar(
        backgroundColor: Colors.indigo[600],//Color(0xFF3d3d3d),
        title: Text("ColibriSoft Services",style:TextStyle(fontFamily: "DellmonteSans")),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Search',
            icon: Icon(Icons.search),
            onPressed: () async{
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate
              );
              if(selected != null){
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("You selected $selected")));
              }
            },
          )
        ]
      ),
      body: GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 5,
      itemBuilder: (BuildContext context,int i){
        return _items(context,this.titles[i], this.images[i],this.xp[i]);
      },
    )
    );
  }
  List<Widget> listTiles(BuildContext context){
    final Widget drawer = 
      DrawerHeader(  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/logo.jpg'
                ),
                radius: 40.0
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                  Container(height: 55, 
                    child:Text(
                      "ColibriSoft",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "DellmonteSans"
                      )
                    )
                  )
                ]
              ),
            ]
        ),
        decoration: BoxDecoration(
          color:Colors.indigo[600],
        ),
      );
    return [
      drawer,
      ListTile(
        onTap: (){
          Navigator.of(context).pushNamed("/home");
        },
        leading: Icon(
          Icons.home,
          color: Colors.white
        ),
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      ListTile(
        onTap: (){ 
          Navigator.of(context).pushNamed("/aboutUs"); 
        },
        leading: Icon(
          Icons.people_outline,
          color: Colors.white
        ),
        title: Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      Divider(
        height: 16.0,
        color: Colors.black45
      ),
      ListTile(
        onTap: (){ 
          Navigator.of(context).pushNamed("/categories"); 
        },
        leading:Icon(
          Icons.web,
          color: Colors.white
        ),
        title: Text(
          "WEB",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      ListTile(
        leading:Icon(
          Icons.mobile_screen_share,
          color: Colors.white
        ),
        title: Text(
          "Mobile Apps",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      ListTile(
        leading:Icon(
          Icons.android,
          color: Colors.white
        ),
        title: Text(
          "Telegram Bots",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      ListTile(
        leading:Icon(
          Icons.stars,
          color: Colors.white
        ),
        title: Text(
          "SMM/SEO",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      ListTile(
        leading:Icon(
          Icons.monetization_on,
          color: Colors.white
        ),
        title: Text(
          "Business Automatisation",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      Divider(
        height: 16.0,
        color: Colors.black45
      ),
      ListTile(
        leading:Icon(
          Icons.settings,
          color: Colors.white
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      ),
      ListTile(
        leading: Icon(
          Icons.help,
          color: Colors.white
        ),
        title: Text(
          "Help",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "DellmonteSans"
          )
        )
      )
    ];
  }
}

class _MySearchdelegate extends SearchDelegate<String>
{
  final List<String> _words;
  final List<String> _history;
  _MySearchdelegate(List<String> words): _words = words,_history = <String>['1','2','3'],super();


  @override
  Widget buildLeading(BuildContext context)
  {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        ),
      onPressed: (){
        this.close(context,null);
      });
  }
  @override
  Widget buildResults(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("You have selected the word:"),
            GestureDetector(
              onTap: (){
                this.close(context,this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context).textTheme.display1.copyWith(
                  fontWeight: FontWeight.bold
                )
              ),
            )
          ]
        )
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context){
    final Iterable<String> suggestions = this.query.isEmpty? _history: _words.where((word)=>word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion){
        this.query = suggestion;
        this._history.insert(0,suggestion);
        showResults(context);
      },
    );
  
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isEmpty? IconButton(
        tooltip: 'Voice Search',
        icon: const Icon(Icons.mic),
        onPressed: (){
          this.query = 'hey!';
        },
      ): IconButton(
          tooltip: 'Clear',
          icon: Icon(Icons.clear),
          onPressed: (){
            query = '';
            showSuggestions(context);
          },
        )
    ];
  }
}
class _SuggestionList extends StatelessWidget{
  const _SuggestionList({this.suggestions,this.query,this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context)
  {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context,int i){
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty? Icon(Icons.history):Icon(null),
          title: RichText(
            text: TextSpan(text:suggestion.substring(0,query.length),
            style: textTheme.copyWith(fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: suggestion.substring(query.length),style: textTheme),
            ]
            )
          ),
          onTap: (){
            onSelected(suggestion);
          }, 
        );
      },
    );
  }
}