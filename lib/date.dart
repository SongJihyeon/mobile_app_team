import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Show.dart';

class DatePage extends StatefulWidget{
  const DatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DatePageState();
}

class DatePageState extends State<DatePage>{
  @override
  Widget build(BuildContext context) {
    List<Show> shows_sort = [];
    for(int i=0; i<shows.length; i++){
        shows_sort.add(shows[i]);
    }
    print(shows_sort.length);
    shows_sort.sort((a,b) => a.stdate.toString().compareTo(b.stdate.toString()));
    // print(shows_sort.length);
   return Scaffold(
       appBar: AppBar(
       title: Text('Date'),
         automaticallyImplyLeading: false,
    ),
     body: ListView.builder(
         padding: const EdgeInsets.all(10.0),
         itemCount: shows_sort.length,
         itemBuilder: (BuildContext context, int index){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 80,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(
                   Radius.circular(10),
                 ),
                 border: Border.all(
                   color: Color(0xFFD2D2FF),
                   width: 2,
                 ),
               ),
               child: Row(
                 children: [
                   SizedBox(width: 10),
                   Text(shows_sort[index].stdate + " ~"),
                   SizedBox(width: 20),
                   SizedBox(
                     width: 230,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("공연명: " + shows_sort[index].show_name),
                         SizedBox(height: 8),
                         Text("출연진: " + shows_sort[index].actors.toString()),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           );
         }
     )
   );
  }

}