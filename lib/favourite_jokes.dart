import 'package:flutter/material.dart';

class FavouriteJokesPage extends StatelessWidget {
  const FavouriteJokesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite jokes")),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("Favorite joke  $index"),
            );
          }),
    );
  }
}
