import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/models/movie_details_model.dart';
import 'package:tmdb_movie_app/models/movies_model.dart';
import 'package:tmdb_movie_app/services/api_services.dart';

class MovieDetails extends StatefulWidget {
  Movie movie;

  MovieDetails({required this.movie, super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  ApiService service = ApiService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: FutureBuilder(
        future: service.getDetails(id: widget.movie.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MovieDetailsModel data = snapshot.data!;
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.darken),
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${widget.movie.backdropPath.toString()}"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Align(
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
                    ],
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
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${widget.movie.posterPath.toString()}"))),
                      ),
                      Container(
                        width: size.width * 0.46,
                        height: size.width * 0.8,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    alignment: WrapAlignment.spaceAround,
                                      children: List.generate(
                                    data.genres!.length,
                                    (index) => data.genres![index].name
                                                .toString() ==
                                            ""
                                        ? const SizedBox()
                                        : Card(
                                            elevation: 5,
                                            color: Colors.purple,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                data.genres![index].name
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            )),
                                  )),
                                  Column(
                                    children: [
                                      Wrap(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text("Release Date : ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600)),
                                          ),
                                          Card(
                                              elevation: 5,
                                              color: Colors.blue,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  widget.movie.releaseDate
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Wrap(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text("Vote Average : ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600)),
                                          ),
                                          Card(
                                              elevation: 5,
                                              color: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  widget.movie.voteAverage
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.movie.overview.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Production Companies",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          data.company!.length,
                          (index) => data.company![index].logo.toString() == ""
                              ? const SizedBox()
                              : Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          "https://image.tmdb.org/t/p/w500${data.company![index].logo.toString()}",
                                          width: 150,
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                        Text(data.company![index].name.toString())
                                      ],
                                    ),
                                  ),
                                )),
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ))),
    );
  }
}
