import 'package:chuck_norris_2_0/joke.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouriteJokesPage extends StatefulWidget {
  const FavouriteJokesPage({super.key});

  @override
  State<StatefulWidget> createState() => _FavouriteJokesPage();
}

class _FavouriteJokesPage extends State<FavouriteJokesPage> {
  Box<dynamic> jokesBox = Hive.box("jokes");
  static const textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite jokes")),
      body: ValueListenableBuilder(
          valueListenable: jokesBox.listenable(),
          builder: (BuildContext context, Box<dynamic> jokes, Widget? child) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                Joke joke = jokes.getAt(index) ??
                    Joke(id: "0", value: "Not loaded string");
                return ListTile(
                  title: Text(joke.value, style: textStyle),
                );
              },
            );
          }),
    );
  }
}
