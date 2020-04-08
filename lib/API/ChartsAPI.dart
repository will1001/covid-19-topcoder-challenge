import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<ChartsAPI>> fetchChartsAPI() async {
  final response =
      await http.get('https://thevirustracker.com/timeline/map-data.json');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body)["data"];
    return (responseJson as List).map((p) => ChartsAPI.fromJson(p)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class ChartsAPI {
  final String countrycode;
  final String date;
  final String cases;
  final String deaths;
  final String recovered;

  ChartsAPI({
    this.countrycode,
    this.date,
    this.cases,
    this.deaths,
    this.recovered,
  });

  factory ChartsAPI.fromJson(Map<String, dynamic> json) {
    return ChartsAPI(
      countrycode: json['countrycode'],
      date: json['date'],
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}
