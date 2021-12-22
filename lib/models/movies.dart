class Movie {
  String title;
  String year;
  String type;
  String imageUrl;
  String imdbID;

  Movie({
    required this.title,
    required this.year,
    required this.type,
    required this.imageUrl,
    required this.imdbID,
  });

  factory Movie.fromJson(dynamic json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      type: json['Type'],
      imageUrl: json['Poster'],
      imdbID: json['imdbID'],
    );
  }
}
