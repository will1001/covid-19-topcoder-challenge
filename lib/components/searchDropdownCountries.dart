import 'package:covid19_app/API/ReportByCountryAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

Widget searchDropdownCountries(String selectedCountry) {
  
  return FutureBuilder<List<ReportByCountryAPI>>(
    future: fetchReportByCountryAPI(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final List<DropdownMenuItem> items = snapshot.data.reversed.map((f) {
          return DropdownMenuItem(
            child: ListTile(
              leading: Image.network(
                f.flag,
                width: 24,
                height: 24,
              ),
              title: Text(f.country),
            ),
            value: '${f.countryCode}|${f.country}',
          );
        }).toList();

        return SearchableDropdown.single(
          items: items,
          value: selectedCountry,
          hint: "Select one",
          searchHint: "Select one",
          isExpanded: true,
          onChanged: (value) {
           selectedCountry = value;
          },
        );
      }

      return CircularProgressIndicator();
    },
  );
}
