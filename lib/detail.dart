import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Show.dart';

// class DetailPage extends StatefulWidget{
//   const DetailPage({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => DetailPageState();
//
// }

//class DetailPageState extends State<DetailPage>{

class DetailPage extends StatelessWidget{

  final int index;
  DetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    var showlist = shows[index];
   return Scaffold(
     appBar: AppBar(
       title: Text('Detail'),
     ),
     body: ListView(
       children: <Widget> [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: 400,
             child: Hero(
               tag: showlist.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                showlist.image.toString(),
                fit: BoxFit.fill,
             ),
           ),
         ),
       ),
     ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // child:Padding(
          //    padding: const EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
                ),
            border: Border.all(
            color: Color(0xFFA5E1F2),
            width: 5,
            ),
          ),

             child: Column(
               //mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('공연명: ' + showlist.show_name.toString(), style: TextStyle(fontSize: 20),),
                 SizedBox(height: 10),
                 Text('출연진: ' + showlist.actors.toString(), style: TextStyle(fontSize: 20)),
                 SizedBox(height: 10),
                 Text('공연날짜: ' + showlist.stdate.toString() + ' ~ ' + showlist.eddate.toString(), style: TextStyle(fontSize: 20)),
                 SizedBox(height: 10),
                 Text('공연장소: ' + showlist.center.toString(),style: TextStyle(fontSize: 20)),
               ],
             ),

         //  ),

        ),
      ),

       ],
     ),
   );
  }

}