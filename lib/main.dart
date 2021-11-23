import 'package:flutter/material.dart';
import 'Show.dart';
import 'load_shows.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test for API"),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                semanticLabel: 'logout',
              ),
              onPressed: () {
                //print('Search button');
                ShowRepository().fetchShow();
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                semanticLabel: 'logout',
              ),
              onPressed: () {
                //print('Search button');
                print(shows[0].show_name);
              },
            ),
          ],
        )
      ),
    );
  }
}
