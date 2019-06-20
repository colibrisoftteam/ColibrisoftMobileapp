import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as english_words;

class SearchAction extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return SearchActionState();
  }
}

class SearchActionState extends State<SearchAction>
{
  final List<String> kEnglishWords;
  _MySearchdelegate _delegate;
  SearchActionState(): kEnglishWords = List.from(Set.from(english_words.all))
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

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text("Search..."),
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
      body: Scrollbar(child: ListView.builder(
        itemCount: kEnglishWords.length,
        itemBuilder: (context,i){
          return ListTile(title: Text(kEnglishWords[i]));
        },
      ),)
    );
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
