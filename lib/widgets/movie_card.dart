import 'package:flutter/material.dart';
import 'package:imdb/models/movies.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Image.network(
                movie.imageUrl == 'N/A'
                    ? "assets/images/No_image_available.png"
                    : movie.imageUrl,
                height: 120,
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(movie.year),
                Text(movie.imdbID),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
