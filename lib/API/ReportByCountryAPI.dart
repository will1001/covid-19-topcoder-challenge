import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<ReportByCountryAPI>> fetchReportByCountryAPI() async {
  final response =
      await http.get('https://corona.lmao.ninja/countries?sort=country');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    return (responseJson as List)
        .map((p) => ReportByCountryAPI.fromJson(p))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class ReportByCountryAPI {
  final String country;
  final String flag;
  final int cases;
  final int active;
  final int recovered;
  final int deaths;

  ReportByCountryAPI({
    this.country,
    this.flag,
    this.cases,
    this.active,
    this.recovered,
    this.deaths,
  });

  factory ReportByCountryAPI.fromJson(Map<String, dynamic> json) {
    return ReportByCountryAPI(
      country: json['country'],
      flag: json['countryInfo']['flag'],
      cases: json['cases'],
      active: json['active'],
      recovered: json['recovered'],
      deaths: json['deaths'],
    );
  }
}
