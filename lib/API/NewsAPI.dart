import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<NewsAPI>> fetchNewsAPI() async {
  final response = await http.get(
      'http://newsapi.org/v2/top-headlines?country=id&apiKey=3366c90bbc9e4c3baaa41ad7dcb4c45d');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body)["articles"];
    return (responseJson as List).map((p) => NewsAPI.fromJson(p)).toList();
    // return NewsAPI.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class NewsAPI {
  // final List<dynamic> articles;
  final String title;

  NewsAPI({
    // this.articles,
    this.title,
  });

  factory NewsAPI.fromJson(Map<String, dynamic> json) {
    return NewsAPI(
      // articles: json['articles'],
      title: json['title'],
    );
  }
}
