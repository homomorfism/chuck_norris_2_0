import 'package:flutter/material.dart';

import 'favourite_jokes.dart';

class LookJokesPage extends StatelessWidget {
  final currentJoke = "Here will be a joke";

  const LookJokesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme
          .of(context)
          .colorScheme
          .onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Check jokes"),
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
                child: Text(currentJoke),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Next joke"),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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
