import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}


class Show {
  const Show({
    required this.stdate,
    required this.eddate,
    required this.show_name,
    required this.location,
    required this.actors,
    required this.like,
  });

  final String stdate;
  final String eddate;
  final String show_name;
  final String location;
  final String actors;
  final List<String> like;
}



class ShowRepository{
  Future<void> fetchShow() async{
    final shows = <Show>[];
    final url = 'http://www.kopis.or.kr/openApi/restful/prfplc?service=1ba3eb65b2b14d78bc7f574ecc23f23b&cpage=1&rows=5&shprfnmfct=예술의전당';
    print("url: $url");

    final response = await http.get(url);

    if(response.statusCode == 200){
      final xml = response.body;
      print("xml: $xml");
    }
    // return [];
  }
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
        child: IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            semanticLabel: 'logout',
          ),
          onPressed: () {
            //print('Search button');
            ShowRepository().fetchShow();
          },
        ),
      ),
    );
  }
}
