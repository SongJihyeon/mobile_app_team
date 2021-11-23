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