import 'package:flutter/material.dart';
import 'package:imdb/models/movie_info.dart';
import 'package:imdb/utilities/movie_services.dart';

class MovieDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;
  MovieDetail({required this.imdbId, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(this.movieName),
      ),
      body: FutureBuilder<MovieInfo>(
        future: getMovie(this.imdbId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (snapshot.data!.poster != "N/A")
                        ? Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                snapshot.data!.poster,
                                width: 200,
                                // fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                "assets/images/No_image_available.png",
                                width: 200,
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      snapshot.data!.plot,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Year: ' + snapshot.data!.year,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Genre: ' + snapshot.data!.genre,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Director: ' + snapshot.data!.director,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Runtime: ' + snapshot.data!.runtime,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Rating: ' + snapshot.data!.rating,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: snapshot.data!.imdbRating != "N/A"
                            ? double.parse(snapshot.data!.imdbRating) > 7.0
                                ? Colors.green
                                : Colors.blue
                            : Colors.red,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        'IMDB Rating: ' + snapshot.data!.imdbRating,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
