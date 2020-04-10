import 'package:covid19_app/API/ReportByCountryAPI.dart';
import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class ReportsByCountry extends StatefulWidget {
  @override
  _ReportsByCountryState createState() => _ReportsByCountryState();
}

class _ReportsByCountryState extends State<ReportsByCountry> {
  String selectedCountry;
  String sortingCategory;
  bool isAsc = true;

  sortingData(List<ReportByCountryAPI> data) {
    data.sort((a, b) {
      switch (sortingCategory) {
        case "Total Cases":
          return b.cases.compareTo(a.cases);
          break;
        case "Active Cases":
          return b.active.compareTo(a.active);
          break;
        case "Total Recovered":
          return b.recovered.compareTo(a.recovered);
          break;
        case "Total Deaths":
          return b.deaths.compareTo(a.deaths);
          break;
        default:
          return a.country.compareTo(b.country);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: HeaderAppBar()),
      body: FutureBuilder<List<ReportByCountryAPI>>(
        future: fetchReportByCountryAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var dataSearch = snapshot.data
                .where((f) => f.country == selectedCountry)
                .toList();
            var allData = snapshot.data;

            sortingData(dataSearch);
            sortingData(allData);


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
                value: f.country,
              );
            }).toList();

            return ListView(
              children: <Widget>[
                SearchableDropdown.single(
                  items: items,
                  value: selectedCountry,
                  hint: "Select one",
                  searchHint: "Select one",
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      selectedCountry = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DropdownButton(
                        hint: Text("Sort By"),
                        // isExpanded: true,
                        value: sortingCategory,
                        items: [
                          "Total Cases",
                          "Active Cases",
                          "Total Recovered",
                          "Total Deaths",
                        ].map((item) {
                          return DropdownMenuItem(
                            child: Text(item),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            sortingCategory = value;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.clear,
                          color: sortingCategory == null
                              ? Colors.black26
                              : Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            sortingCategory = null;
                          });
                        },
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Switch(
                      value: isAsc,
                      onChanged: (value) {
                        setState(() {
                          isAsc = value;
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                    Text('Order by : ${isAsc ? "Asc" : "Desc"}')
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: (selectedCountry == null ? isAsc?allData:allData.reversed : isAsc?dataSearch:dataSearch.reversed)
                        .map((f) {
                      return ExpansionTile(
                        leading: Image.network(
                          f.flag,
                          width: 24,
                          height: 24,
                        ),
                        title: Text(f.country),
                        // trailing: Text(f.cases.toString()),
                        children: <Widget>[
                          ListTile(
                            title: Text("Total Cases"),
                            trailing: Text(f.cases.toString()),
                          ),
                          ListTile(
                            title: Text("Active Cases"),
                            trailing: Text(f.active.toString()),
                          ),
                          ListTile(
                            title: Text("Recovered"),
                            trailing: Text(f.recovered.toString()),
                          ),
                          ListTile(
                            title: Text("Deaths"),
                            trailing: Text(f.deaths.toString()),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
