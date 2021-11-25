import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert' as convert;
import 'Show.dart';


//데이터 string으로 받아오는 class
class ShowRepository{
  Future<void> fetchShow() async{
    var url = Uri.parse('http://www.kopis.or.kr/openApi/restful/pblprfr?service=1ba3eb65b2b14d78bc7f574ecc23f23b&stdate=20211201&eddate=20220630&shcate=AAAB&rows=100&cpage=1');
    // print("url: $url");

    final response = await http.get(url);

    if(response.statusCode == 200){
      final xml = response.body;
      // print("xml: $xml");

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
    }
    // print(shows[9].show_name);
  }
}