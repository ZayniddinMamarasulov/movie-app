import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view_model/movies_list_vm.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String imageUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    Provider.of<MoviesListViewModel>(context, listen: false).getFromApi();

    return Scaffold(body: Container(
      child: Consumer<MoviesListViewModel>(builder: (context, data, child) {
        return ListView.builder(
            itemCount: data.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return movieItem(data.movies[index]);
            });
      }),
    ));
  }

  Widget movieItem(Movie movie) {
    return Card(
      elevation: 12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            width: 180,
            height: 156,
            child: Image.network(
              "$imageUrl${movie.backdropPath}",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(movie.originalTitle!),
                Text(movie.voteAverage.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
