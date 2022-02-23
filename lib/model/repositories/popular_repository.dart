import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/services/base_service.dart';
import 'package:movie_app/model/services/popular_service.dart';

class PopularRepository {
  BaseService _popularService = PopularService();

  Future<List<Movie>> fetchMovies() async {
    dynamic response = await _popularService.getResponse('/popular');

    final jsonData = response['results'] as List;

    List<Movie> movies = jsonData.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }
}
