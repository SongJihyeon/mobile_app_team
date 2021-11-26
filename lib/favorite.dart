import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget{
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FavoritePageState();

}

class FavoritePageState extends State<FavoritePage>{
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