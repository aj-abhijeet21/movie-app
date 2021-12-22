import 'package:flutter/material.dart';
import 'package:imdb/utilities/movie_services.dart';
import 'package:imdb/widgets/movie_list.dart';
import 'package:imdb/models/movies.dart';
import 'package:imdb/screens/movie_detail.dart';

class MoviesHome extends StatefulWidget {
  const MoviesHome({Key? key}) : super(key: key);

  @override
  _MoviesHomeState createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  TextEditingController searchTextController = TextEditingController();
  String searchText = '';

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetail(
          movieName: item.title,
          imdbId: item.imdbID,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                searchText = searchTextController.text;
                              },
                            );
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.black,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Search for movies',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (searchText.length > 0)
                FutureBuilder<List<Movie>>(
                    future: searchMovie(searchText),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // print(snapshot.data);
                        return MovieList(
                          movies: snapshot.data!,
                          itemClick: this.itemClick,
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                          ),
                        );
                      }
                    }),
            ],
          ),
        ),
      ),
    );
  }
}
