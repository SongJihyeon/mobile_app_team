import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'Show.dart';

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
      body: Container(
      child: GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(6.0),
      childAspectRatio: 9.0 / 10.0,
      children: List.generate(100, (index) {
        return Card(
            child: Container(
              color: Color(0xFFB9F7FF),
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                 Container(
                   alignment: Alignment.center,
                   width: 160,
                   height: 40,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     color: Colors.white,
                   ),
                   child: Text(
                       '홍광호'
                   ),
                 ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    alignment: Alignment.center,
                    width: 160,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text('대표작'),
                        Text('지킬 앤 하이드'),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite
                                    // shows.isFavorite ? Icons.favorite : Icons.favorite_border
                                  ),
                                  iconSize: 35,
                                  color: Colors.red,
                                  onPressed: () {
                                    print('I like it!');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                     ],
                    ),
                  ),

                ],
              ),
            ),
          );
        }),
      ),
     ),
  );
}

}