import 'dart:convert';

import 'package:http/http.dart';
import 'package:tmdb_movie_app/models/movie_details_model.dart';
import 'package:tmdb_movie_app/models/movies_model.dart';

class ApiService {

  final apiKey = "api_key=c8416b34949af55dcf0d0658ef39e35a";
  final popular = "https://api.themoviedb.org/3/movie/popular?";

  // >>>>>>>>>>>>>>>>>>>> get popular movies

  Future<List<Movie>> getMovies({required int page}) async {
    // send request
    Response response = await get(Uri.parse("$popular$apiKey&page=$page"));
    // check response status code
    if(response.statusCode == 200) {
      // extract response body
      Map<String, dynamic> body = jsonDecode(response.body);
      // extract results from body
      List<dynamic> data = body["results"];
      // map to Movie model
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    }else {
      throw Exception(response.statusCode);
    }
  }

  Future<MovieDetailsModel> getDetails({required String id}) async {
    Response response = await get(Uri.parse("https://api.themoviedb.org/3/movie/$id?$apiKey"));
    if(response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return MovieDetailsModel.fromJson(json);
    }else {
      throw Exception(response.statusCode);
    }
  }

  Future<MovieDetailsModel> getMovieDetails({required String id}) async {
    Response response = await get(Uri.parse("https://api.themoviedb.org/3/movie/$id?$apiKey"));
    if(response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return MovieDetailsModel.fromJson(json);
    }else {
      throw Exception(response.statusCode);
    }
  }

}