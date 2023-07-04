import 'package:tmdb_movie_app/models/company_model.dart';
import 'package:tmdb_movie_app/models/genres.dart';

class MovieDetailsModel {
  bool? isAdult;
  String? tagline;
  List<Company>? company;
  List<Genres>? genres;

  MovieDetailsModel({this.company, this.isAdult, this.tagline, this.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    List<Company> companies = (json['production_companies'] as List)
    .map((company) => Company.fromJson(company)).toList();
    List<Genres> genries = (json['genres'] as List)
    .map((genres) => Genres.fromJson(genres)).toList();
    
    return MovieDetailsModel(
      company: companies,
      isAdult: json['adult'],
      tagline: json['tagline'],
      genres: genries,
    );
  }

}