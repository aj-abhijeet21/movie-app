// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:imdb/models/movie_list.dart';
// import 'package:imdb/models/movies.dart';
// import 'package:imdb/screens/movie_detail.dart';
// import 'package:imdb/widgets/card.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   TextEditingController searchTextController = TextEditingController();
//   String searchText = '';

//   var url = Uri.parse('http://www.omdbapi.com/?t=avengers&apikey=8923dcd0');
//   List movieList = [];

//   @override
//   initState() {
//     super.initState();
//     searchMovie();
//   }

//   @override
//   void dispose() {
//     searchTextController.dispose();
//     super.dispose();
//   }

//   Future<List<Movie>> searchMovie() async {
//     var res = await http.get(url);

//     if (res.statusCode == 200) {
//       Map data = jsonDecode(res.body);

//       var list = (data as List).map((item) => Movie.fromJson(item)).toList();
//       return list;
//       // var jsonData = jsonDecode(res.body);

//       // Movie movie = Movie.fromJson(jsonData);
//       // movieList.add(movie);
//       // setState(() {});
//       // return movie;
//     }
//     throw 'Unable to retrive movies';
//   }

//   void itemClick(Movie item) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => MovieDetail(
//               // movieName: item.title,
//               // imdbId: item.imdbID,
//               )),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Text(
//             'Home',
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: searchTextController,
//                   decoration: const InputDecoration(
//                     hintText: 'Search movie name',
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     searchText = searchTextController.text;
//                   });
//                   if (searchText.length > 0) {
//                     FutureBuilder<List<Movie>>(
//                       future: searchMovie(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           // return Expanded(
//                           //   child: MovieCard(movie: snapshot.,),
//                           //   // child: MovieList(
//                           //   //   movies: snapshot.data!,
//                           //   //   itemClick: this.itemClick,
//                           //   // ),
//                           // );
//                         } else if (snapshot.hasError) {
//                           return Text(snapshot.error.toString());
//                         }
//                         return CircularProgressIndicator();
//                       },
//                     );
//                   }
//                 },
//                 icon: const Icon(Icons.search),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           // FutureBuilder(
//           //   future: searchMovie(),
//           //   builder: (context, snapshot) {
//           //     if (snapshot.data == null) {
//           //       return Container(
//           //         child: Center(
//           //           child: Text('Loading...'),
//           //         ),
//           //       );
//           //     } else
//           //       return ListView.builder(
//           //           shrinkWrap: true,
//           //           itemCount: snapshot.data!.length,
//           //           itemBuilder: (context, index) {
//           //             return MovieCard(
//           //                 title: movieList[0].title,
//           //                 genre: movieList[0].genre,
//           //                 imageUrl: movieList[0].imageUrl,
//           //                 rating: movieList[0].rating,
//           //                 year: movieList[0].year);
//           //           });
//           //   },
//           // ),
//         ],
//       ),
//     );
//   }
// }

