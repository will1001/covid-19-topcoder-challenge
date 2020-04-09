import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

Future<List<NewsAPI>> fetchNewsAPI() async {
  final response = await http.get(
      'http://newsapi.org/v2/top-headlines?country=id&apiKey=3366c90bbc9e4c3baaa41ad7dcb4c45d');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body)["articles"];
    return (responseJson as List).map((p) => NewsAPI.fromJson(p)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class NewsAPI {
  final dynamic id;
  final String title;
  final String srcimg;

  NewsAPI({
    this.id,
    this.title,
    this.srcimg,
  });

  factory NewsAPI.fromJson(Map<String, dynamic> json) {
    return NewsAPI(
      id: Uuid(),
      title: json['title'],
      srcimg: json['urlToImage'],
    );
  }
}
