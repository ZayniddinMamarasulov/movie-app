import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/model/my_movie.dart';

import 'input_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  CollectionReference<MyMovie> fetchMovies() {
    return FirebaseFirestore.instance
        .collection('movies')
        .withConverter<MyMovie>(
          fromFirestore: (snapshots, _) => MyMovie.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final moviesRef = fetchMovies();

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot<MyMovie>>(
          stream: moviesRef.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: snapshot.data?.size,
                itemBuilder: (context, index) {
                  final item = snapshot.data!.docs[index].data();
                  return Dismissible(
                    key: Key(item.name!),
                    onDismissed: (direction) {
                      // Remove the item from the data source.
                      setState(() {
                        _delete(item);
                      });
                      // Then show a snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item.name} dismissed')));
                    },
                    child: movieWidget(item, index),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputPage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget movieWidget(MyMovie movie, int index) {
    return Card(
      elevation: 28,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 180,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            Container(
              height: 180,
              width: 140,
              child: FadeInImage(
                image: NetworkImage(movie.imageUrl!),
                placeholder: const AssetImage('assets/default.jpeg'),
              ),
            ),
            const SizedBox(width: 24),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index.toString(),
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.name!,
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.genre!,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.year.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _delete(MyMovie movie) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      firestore
          .collection('movies')
          .doc("${movie.name!.replaceAll(" ", "_")}_${movie.year}")
          .delete();

      fetchMovies();
    } catch (e) {
      print(e);
    }
  }
}
