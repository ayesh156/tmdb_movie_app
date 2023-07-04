class Movie{
  String? posterPath;
  String? overview;
  int? id;
  String? title;
  String? backdropPath;
  String? voteAverage;
  String? releaseDate;

  Movie({this.backdropPath,this.id,this.overview,this.posterPath,this.title,this.voteAverage,this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      backdropPath: map['backdrop_path'],
      id: map['id'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      title: map['title'],
voteAverage: map['vote_average'].toString(),
releaseDate: map['release_date']
    );
  }

}