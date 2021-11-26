import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert' as convert;
import 'Show.dart';

var actors_set = {''};
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
          id: json1['mt20id'],
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
  
  Future<void> fetchActor() async{
    await fetchShow();
    for(int i=0; i<100; i++){
        String id = shows[i].id;
        var url2 = Uri.parse('http://www.kopis.or.kr/openApi/restful/pblprfr/$id?service=1ba3eb65b2b14d78bc7f574ecc23f23b');
        final response_actor = await http.get(url2);
        if(response_actor.statusCode == 200){
          final xml_actor = response_actor.body;
          // print(xml_actor);
          final xml2json_actor = Xml2Json()..parse(xml_actor);
          final json_actor = convert.jsonDecode(xml2json_actor.toParker());
          final json_actor_show = json_actor['dbs']['db'];
          String actors = json_actor_show['prfcrew'];
          if(actors != null){
            List<String> split_actors = actors.split(', ');
            shows[i].actors = split_actors;
            for(int j=0; j<split_actors.length; j++)
              actors_set.add(split_actors[j]);
          }
        }
      }
  }
}