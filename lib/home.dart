import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Show.dart';
import 'load_shows.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}
// class HomePage extends StatefulWidget {
//   HomePage({required this.Shows});
//   final List<Show> Shows;
//   // const HomePage({Key? key}) : super(key: key);
//
//   @override
//   HomePageState createState() => HomePageState();
// }

class HomePageState extends State<HomePage>{
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: menu',
      //  style: optionStyle,
    ),
    Text(
      'Index 1: search',
      //  style: optionStyle,
    ),
    Text(
      'Index 2: home',
      style: optionStyle,
    ),
    Text(
      'Index 3: favorite',
      // style: optionStyle,
    ),
    Text(
      'Index 4: profile',
      // style: optionStyle,
    ),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          // children: _buildGridCards(context),
          children: [
            Text(shows[0].show_name),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFA5E1F2),
        //fixedColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label:'menu',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label:'search',
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'home',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label:'favorite',
            //  backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label:'profile',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        //showSelectedLabels: false,

      ),
      resizeToAvoidBottomInset: false,
    );
  }
}