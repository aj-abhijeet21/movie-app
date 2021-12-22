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
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 20.0,
              offset: Offset(2.0, 2.0),
              spreadRadius: 1.0,
              color: Colors.grey),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (movie.imageUrl != "N/A")
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        movie.imageUrl,
                        height: 130,
                        fit: BoxFit.fill,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        "assets/images/No_image_available.png",
                        width: 100,
                      ),
                    ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(movie.type),
                Text('Release year: ${movie.year}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
