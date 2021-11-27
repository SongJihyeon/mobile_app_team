import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'Show.dart';
import 'date.dart';
import 'favorite.dart';
import 'profile.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[ DatePage(), SearchPage(), ShowHome(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFA5E1F2),
        //fixedColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'date',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'favorite',
            //  backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label: 'profile',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
        //showSelectedLabels: false,
      ),

      body: _widgetOptions.elementAt(_selectedIndex),
      resizeToAvoidBottomInset: false,
    );
  }
}


class ShowHome extends StatefulWidget{
  const ShowHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShowHomeState();
}

class ShowHomeState extends State<ShowHome>{
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
           Container(
             height: 200,
             child: Swiper(
                 itemHeight: 20,
                 pagination: SwiperPagination(),
                 itemCount: 3,
                 itemBuilder: (BuildContext context, int index){
                   return Image.network(
                     shows[index].image.toString(),
                     fit: BoxFit.fitWidth,
                   );
                 },
             ),
           ),

            Container(
            height: 700,
              child: Center(
                child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(6.0),
                childAspectRatio: 8.0 / 15.0,
                children: List.generate(100, (index) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                              child: AspectRatio(
                                aspectRatio: 11 / 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  shows[index].image.toString(),
                                  fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                        ),

                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        shows[index].show_name.toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        shows[index].stdate.toString() + "\n~ " + shows[index].eddate.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
              ),
            ),
        ],
    );
  }

}