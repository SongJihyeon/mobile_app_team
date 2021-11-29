import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'load_shows.dart';

class SearchPage extends StatefulWidget{
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchPageState();

}

class SearchPageState extends State<SearchPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
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