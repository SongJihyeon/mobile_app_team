//데이터 형식 class
class Show {
  String id;
  String stdate;
  String eddate;
  String show_name;
  // final String location;
  List<String> actors;
  List<String> like;
  String image;
  String center;
  String center_id;
  String la;
  String lo;

  Show({
    required this.id,
    required this.stdate,
    required this.eddate,
    required this.show_name,
    // required this.location,
    required this.actors,
    required this.like,
    required this.image,
    required this.center,
    required this.center_id,
    required this.la,
    required this.lo,
  });
}

var shows = <Show>[];