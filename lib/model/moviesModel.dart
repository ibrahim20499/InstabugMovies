import 'dart:convert';

List<Movies>? postFromJson(String str) =>
    List<Movies>.from(json.decode(str).map((x) => Movies.fromjson(x)));
class Movies{
  final poster_path;
  final adult;
  final overview;
  final release_date;
  final  genre_ids;
  final id;
  final original_title;
  final original_language;
  final title;
  final backdrop_path;
  final popularity;
  final vote_count;
  final video;
  final vote_average;
  Movies({
    this.id, this.title,
    this.adult,
    this.original_language,
    this.overview,
    this.poster_path,
    this.release_date,
    this.backdrop_path,
    this.genre_ids,
    this.original_title,
    this.popularity,
    this.video,
    this.vote_average,
    this.vote_count,
  });
  factory Movies.fromjson(Map<String , dynamic> parsedJson) {
    return Movies(
      poster_path:parsedJson['poster_path'],
      adult: parsedJson['adult'],
     overview: parsedJson['overview'],
     release_date:  parsedJson["release_date"],
     genre_ids: parsedJson["genre_ids"],
     id: parsedJson["id"],
     original_language: parsedJson['original_language'],
     title: parsedJson['title'],
     backdrop_path: parsedJson['backdrop_path'],
     popularity: parsedJson['popularity'],
     vote_count: parsedJson['vote_count'],
     video: parsedJson['video'],
     vote_average: parsedJson['vote_average'],);
  }
}