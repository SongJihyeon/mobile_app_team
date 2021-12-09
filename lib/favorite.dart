import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Show.dart';


var actor = [];
Future<void> favorite_actor() async{
  // FirebaseFirestore firestore = await FirebaseFirestore.instance;
  // Stream collectionStream = await firestore.collection('user').snapshots();
  //
  // await collectionStream.listen((snapshots) {
  //   snapshots.docs.forEach((document) async {
  //     actor.add(document.data()['actor'].toString());
  //   });
  // });
  //
  // print(actor);
  var snapshot = FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).get();
  // print(snapshot);
  snapshot.then( (Snapshot) => {
    actor = Snapshot['actor'],
  });

}

class FavoritePage extends StatefulWidget{
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage>{
  @override
  Widget build(BuildContext context) {
    favorite_actor();
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
      padding: const EdgeInsets.all(7.0),
      childAspectRatio: 9.0 / 9.0,
      children: List.generate(actor.length, (index) {
        return Card(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xFFD2D2FF),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    alignment: Alignment.center,
                    width: 160,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(actor[index].toString()),
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
                                  iconSize: 30,
                                  color: Color(0xFFFFBBC6),
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