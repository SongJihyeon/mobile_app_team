import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

//데이터 형식 class
class Show {
  String stdate;
  String eddate;
  String show_name;
  // final String location;
  String actors;
  List<String> like;
  String image;

  Show({
    required this.stdate,
    required this.eddate,
    required this.show_name,
    // required this.location,
    required this.actors,
    required this.like,
    required this.image,
  });
}


final shows = <Show>[];
//데이터 string으로 받아오는 class
class ShowRepository{
  Future<void> fetchShow() async{
    // final url = 'http://www.kopis.or.kr/openApi/restful/pblprfr?service=1ba3eb65b2b14d78bc7f574ecc23f23bstdate=20160101&eddate=20160630&rows=10&cpage=1';
    final url = 'http://www.kopis.or.kr/openApi/restful/pblprfr?service=1ba3eb65b2b14d78bc7f574ecc23f23b&stdate=20211201&eddate=20220630&shcate=AAAB&rows=100&cpage=1';
    // print("url: $url");

    final response = await http.get(url);

    if(response.statusCode == 200){
      final xml = response.body;
      print("xml: $xml");

      final xml2json = Xml2Json()..parse(xml); //json으로 변환
      final json = xml2json.toParker();
      // print('json: $json');
      final jsonResult = convert.jsonDecode(json);
      final jsonShows = jsonResult['dbs'];
      // print(jsonShows);
      for(int i=0; i<100; i++){
        final json1 = jsonShows['db'][i];
        final show = Show(
          stdate: json1['prfpdfrom'],
          eddate: json1['prfpdto'],
          show_name :json1['prfnm'],
          actors: json1['prfcast'],
          like: [""],
          image: json1['poster'],
        );
        shows.add(show);
      }
      // return shows.toList();
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
