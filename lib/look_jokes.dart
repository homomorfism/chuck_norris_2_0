import 'package:chuck_norris_2_0/joke.dart';
import 'package:flutter/material.dart';

import 'favourite_jokes.dart';

class LookJokesPage extends StatefulWidget {
  const LookJokesPage({super.key});

  @override
  State<StatefulWidget> createState() => _LookJokesPage();
}

class _LookJokesPage extends State<LookJokesPage> {
  var currentJoke = Joke(id: "0", value: "This is some joke");

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    const textStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check jokes"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const FavouriteJokesPage()));
            },
            style: style,
            child: const Text('Fav. jokes'),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(40),
            child: Text(currentJoke.value, style: textStyle),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var joke = await getJoke();
                    setState(() {
                      currentJoke = joke ?? currentJoke;
                    });
                  },
                  child: const Text("Next joke"),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    addJokeToHive(currentJoke);
                  },
                  child: const Text("Add to favorite"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
