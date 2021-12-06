import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'load_shows.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";
  @override
  Widget buildResults(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        SizedBox(width: 10),
        SizedBox(
          width: 230,
          child: Text(selectedResult),
        ),
        // SizedBox(width: 260),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }

  List<String> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(actors_set.toList().where(
              // In the false case
              (element) => element.contains(query),
            ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search',
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body:ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: actors_set.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                height: 80,
                width: 300,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    SizedBox(
                      width: 300,
                      child: Text(actors_set.toList()[index]),
                    ),
                    // SizedBox(width: 260),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      color: Colors.red,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              );
            }
        ),
    );
  }
}
