import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'joke.g.dart';

@HiveType(typeId: 0)
class Joke {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String value;

  Joke({required this.id, required this.value});

  Joke.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'];

  Map<String, dynamic> toJson() => {'id': id, 'value': value};
}

Future<Joke?> getJoke() async {
  const String uri = "https://api.chucknorris.io/jokes/random";
  try {
    final Response response = await Dio().get(uri);
    if (kDebugMode) {
      print(response.data);
    }
    return Joke.fromJson(response.data);
  } catch (e) {
    if (kDebugMode) {
      print("Some internet error");
    }
  }
  return null;
}

void addJokeToHive(Joke joke) async {
  var box = Hive.box("jokes");

  if (box.get(joke.id) != null || joke.id == '0') {
    return;
  }

  await box.put(joke.id, joke);
}
