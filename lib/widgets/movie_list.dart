import 'package:flutter/material.dart';
import 'package:imdb/models/movies.dart';
import 'package:imdb/widgets/movie_card.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function itemClick;

  MovieList({required this.itemClick, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(color: Colors.grey),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        itemCount: this.movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: MovieCard(
              movie: this.movies[index],
            ),
            onTap: () => this.itemClick(this.movies[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
