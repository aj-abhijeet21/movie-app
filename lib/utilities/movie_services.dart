import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imdb/models/movie_info.dart';
import 'package:imdb/models/movies.dart';
import 'package:imdb/widgets/movie_list.dart';

Future<List<Movie>> searchMovie(query) async {
  var url = Uri.parse('http://www.omdbapi.com/?s=$query&apikey=8923dcd0');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map jsonData = json.decode(response.body);
    if (jsonData['Response'] == 'True') {
      var data = jsonData['Search'] as List;
      print(data);
      var movieList = data.map((item) => Movie.fromJson(item)).toList();
      print(movieList.length);
      return movieList;
    } else {
      throw Exception(jsonData['Error']);
    }
  } else {
    throw Exception('Unable to fetch movies');
  }
}

Future<MovieInfo> getMovie(movieId) async {
  var url = Uri.parse('http://www.omdbapi.com/?i=$movieId&apikey=8923dcd0');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);

    if (jsonData['Response'] == 'True') {
      return MovieInfo.fromJSON(jsonData);
    } else {
      throw Exception(jsonData['Error']);
    }
  } else {
    throw Exception('Unable to fecth movies');
  }
}
