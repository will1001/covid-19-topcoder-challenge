import 'package:covid19_app/API/NewsAPI.dart';
import 'package:covid19_app/API/ReportByCountryAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'cardNews.dart';

Widget newsList() {
  String selectedCountry;

  var notfoundNews = <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text("Sorry :( , Lates News not Found in Your country"),
      ),
    ) 
  ];

  return ListView(
    children: <Widget>[
      FutureBuilder<List<ReportByCountryAPI>>(
        future: fetchReportByCountryAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DropdownMenuItem> items =
                snapshot.data.reversed.map((f) {
              return DropdownMenuItem(
                child: ListTile(
                  leading: Image.network(
                    f.flag,
                    width: 24,
                    height: 24,
                  ),
                  title: Text(f.country),
                ),
                value:
                    '${f.countryCode == null ? "" : f.countryCode}|${f.country}',
              );
            }).toList();

            return SearchableDropdown.single(
              items: items,
              value: selectedCountry,
              hint: "Select Country",
              searchHint: "Select Country",
              isExpanded: true,
              onChanged: (value) {
                selectedCountry = value;
              },
            );
          }

          return CircularProgressIndicator();
        },
      ),
      FutureBuilder<List<NewsAPI>>(
        future: fetchNewsAPI(
            selectedCountry == null ? "US" : selectedCountry.split("|")[0]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var newsDatas = snapshot.data.map((f) {
              return cardNews(context, f);
            }).toList();

            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: newsDatas.length == 0 ? notfoundNews : newsDatas,
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
    ],
  );
}
