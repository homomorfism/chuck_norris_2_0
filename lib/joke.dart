import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'joke_model.g.dart';


@HiveType(typeId: 0)
class Joke {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String iconUrl;
  @HiveField(2)
  final String value;

  Joke({required this.id, required this.iconUrl, required this.value});

  Joke.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        iconUrl = json['icon_url'],
        value = json['value'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'icon_url': iconUrl, 'value': value};
}

Future<Joke> getJoke() async {
  const String uri = "https://api.chucknorris.io/jokes/random";
  try {
    final Response response = await Dio().get(uri);
    if (kDebugMode) {
      print(response.data);
    }
    return Joke.fromJson(response.data);
  } catch (e) {
    rethrow;
  }
}
