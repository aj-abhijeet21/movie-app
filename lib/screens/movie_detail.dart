import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Image.network(snapshot.data!.poster, width: 200),
                  ),
                  Text(
                    snapshot.data!.plot,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    'Year: ' + snapshot.data!.year,
                  ),
                  Text(
                    'Genre: ' + snapshot.data!.genre,
                  ),
                  Text(
                    'Director: ' + snapshot.data!.director,
                  ),
                  Text(
                    'Runtime: ' + snapshot.data!.runtime,
                  ),
                  Text(
                    'Rating: ' + snapshot.data!.rating,
                  ),
                  Text(
                    'IMDB Rating: ' + snapshot.data!.imdbRating,
                  ),
                  Text(
                    'MetScore: ' + snapshot.data!.metaScore,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
