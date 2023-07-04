class Genres {
  String? name;

  Genres({this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      name: json['name'] ?? "",
    );
  }

}