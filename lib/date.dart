import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
   );
  }

}