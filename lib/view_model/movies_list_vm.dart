import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/api_response.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/repositories/popular_repository.dart';

class MoviesListViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty');

  ApiResponse get response {
    return _apiResponse;
  }

  List<Movie> _movies = [];

  List<Movie> get movies {
    return _movies;
  }

  Future<void> fetchPopularMovies() async {
    try {
      List<Movie> movies = await PopularRepository().fetchMovies();
      _movies = movies;
      _apiResponse = ApiResponse.completed(movies);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
