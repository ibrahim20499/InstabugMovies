import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../model/moviesModel.dart';
import 'package:http/http.dart' as http;

class FetchData extends ChangeNotifier {
  Future<List<Movies>> getData(int pageNumber) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=acea91d2bff1c53e6604e4985b6989e2&page=" +
            pageNumber.toString()));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      Iterable list = data["results"];
      List<Movies> allmovies = [];
      for (var u in list) {
        Movies movies = Movies.fromjson(u);
        allmovies.add(movies);
      }
      if (list != null) {
        allmovies = allmovies.toList();
      }
      return allmovies;
    } else {
      throw Exception("error");
    }
    notifyListeners();
  }
}
