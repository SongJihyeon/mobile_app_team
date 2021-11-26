import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Show.dart';

// List<Show> shows_sort = shows.sort((a,b){
//   var adate = a.stdate;
//   var bdate = b.stdate;
//   return adate.compareTo(bdate);
// });

class DatePage extends StatefulWidget{
  const DatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DatePageState();
}

class DatePageState extends State<DatePage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
       title: Text('Date'),
         automaticallyImplyLeading: false,
    ),
     body: ListView.builder(
         padding: const EdgeInsets.all(10.0),
         itemCount: shows.length,
         itemBuilder: (BuildContext context, int index){
           return Container(
             height: 80,
             child: Row(
               children: [
                 SizedBox(width: 10),
                 Text(shows[index].stdate + " ~"),
                 SizedBox(width: 20),
                 SizedBox(
                   width: 250,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("공연명: " + shows[index].show_name),
                       SizedBox(height: 8),
                       Text("출연진: " + shows[index].actors.toString()),
                     ],
                   ),
                 )
               ],
             ),
           );
         }
     )
   );
  }

}