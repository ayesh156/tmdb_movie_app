import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/models/movies_model.dart';

class MovieDetails extends StatefulWidget {
  Movie movie;

  MovieDetails({required this.movie,super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500${widget.movie.backdropPath.toString()}"
                  )
                  )
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.movie.title.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.5,
                    height: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage("https://image.tmdb.org/t/p/w500${widget.movie.posterPath.toString()}"))
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.movie.overview.toString(),
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            )
          ],
        ),
      )
    );
  }
}