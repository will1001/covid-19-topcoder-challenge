import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<TestAPI>> fetchTestAPI() async {
  final response = await http.get(
      'http://newsapi.org/v2/top-headlines?country=id&apiKey=3366c90bbc9e4c3baaa41ad7dcb4c45d');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body)["articles"];
    return (responseJson as List).map((p) => TestAPI.fromJson(p)).toList();
    // return TestAPI.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class TestAPI {
  // final List<dynamic> articles;
  final String title;
  final String srcimg;

  TestAPI({
    // this.articles,
    this.title,
    this.srcimg,
  });

  factory TestAPI.fromJson(Map<String, dynamic> json) {
    return TestAPI(
      // articles: json['articles'],
      title: json['title'],
      srcimg: json['urlToImage'],
    );
  }
}
