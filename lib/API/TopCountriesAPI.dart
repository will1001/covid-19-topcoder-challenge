import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<TopCountriesAPI>> fetchTopCountriesAPI() async {
  final response = await http.get(
      'https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body)["data"]["rows"];
    return (responseJson as List)
        .map((p) => TopCountriesAPI.fromJson(p))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class TopCountriesAPI {
  final String country;
  final String totalCases;
  final String totalRecovered;
  final String totalDeaths;
  final String activeCases;
  final String flag;

  TopCountriesAPI({
    this.country,
    this.totalCases,
    this.totalRecovered,
    this.totalDeaths,
    this.activeCases,
    this.flag,
  });

  factory TopCountriesAPI.fromJson(Map<String, dynamic> json) {
    return TopCountriesAPI(
      country: json['country'],
      totalCases: json['total_cases'],
      totalRecovered: json['total_recovered'],
      totalDeaths: json['total_deaths'],
      activeCases: json['active_cases'],
      flag: json['flag'],
    );
  }
}
