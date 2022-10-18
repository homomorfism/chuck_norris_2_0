import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'joke.dart';
import 'look_jokes.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(JokeAdapter());

  await Hive.openBox('jokes');
  // Hive.box('jokes').clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: LookJokesPage(),
    );
  }
}
