import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          'Favorite',
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }

}