import 'package:covid19_app/API/ChartsAPI.dart';
import 'package:covid19_app/API/ReportByCountryAPI.dart';
import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:covid19_app/components/LineAreaChart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:searchable_dropdown/searchable_dropdown.dart';

class DetailsChart extends StatefulWidget {
  @override
  _DetailsChartState createState() => _DetailsChartState();
}

class _DetailsChartState extends State<DetailsChart> {
  String selectedCountry;

  convertStringToDateTime(String stringDate) {
    var year = "20" + stringDate.substring(5, 7);
    var month = "0" + stringDate.substring(0, 1);
    var date = stringDate.substring(2, 4);
    var dateTime = DateTime.parse(year + month + date);
    return dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: HeaderAppBar()),
      body: ListView(
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
                    setState(() {
                      print(value);
                      selectedCountry = value;
                    });
                  },
                );
              }

              return CircularProgressIndicator();
            },
          ),
          FutureBuilder<List<ChartsAPI>>(
            future: fetchChartsAPI(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;

                var totalCasesWorld = (String date,String typeData) {
                  var dataWhereDate =
                      data.where((f) => f.date == date).toList();

                  var temp = dataWhereDate
                      .map((f) {
                        switch (typeData) {
                          case "Total Cases":
                            return int.parse(f.cases);
                            break;
                          case "Total Deaths":
                            return int.parse(f.deaths);
                            break;
                          case "Total Recovered":
                            return int.parse(f.recovered);
                            break;
                          default: return int.parse(f.cases);
                        }
                      })
                      .toList()
                      .reduce((a, b) => a + b);
                  return temp;
                };
               
                

                var timeLine = data
                    .map((f) {
                      return f.date;
                    })
                    .toList()
                    .toSet()
                    .toList();

                var chartData = timeLine.map((f) {
                  return new LinearCases(
                      convertStringToDateTime(f), totalCasesWorld(f,"Total Cases"));
                }).toList();
                
                var chartDataDeaths = timeLine.map((f) {
                  return new LinearCases(
                      convertStringToDateTime(f), totalCasesWorld(f,"Total Deaths"));
                }).toList();
                
                var chartDataRecovered = timeLine.map((f) {
                  return new LinearCases(
                      convertStringToDateTime(f), totalCasesWorld(f,"Total Recovered"));
                }).toList();

                List<ChartsAPI> chartDatawhereCountry = data
                    .where((a) => a.countrycode == (selectedCountry==null?selectedCountry:selectedCountry.split('|')[0]))
                    .toList();

                  var chartData2 = chartDatawhereCountry.map((f) {
                  return new LinearCases(
                      convertStringToDateTime(f.date), int.parse(f.cases));
                }).toList();
                 
                  var chartData2Deaths = chartDatawhereCountry.map((f) {
                  return new LinearCases(
                      convertStringToDateTime(f.date), int.parse(f.deaths));
                }).toList();
                
                  var chartData2Recovered = chartDatawhereCountry.map((f) {
                  return new LinearCases(
                      convertStringToDateTime(f.date), int.parse(f.recovered));
                }).toList();

                return Column(
                  children: <Widget>[
                    Text("total Cases :"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: LineAreaChart(
                        _plotData(selectedCountry==null?chartData:chartData2),
                        animate: false,
                      ),
                    ),
                    Text("Death :"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: LineAreaChart(
                        _plotData(selectedCountry==null?chartDataDeaths:chartData2Deaths),
                        animate: false,
                      ),
                    ),
                    Text("Recovered :"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: LineAreaChart(
                        _plotData(selectedCountry==null?chartDataRecovered:chartData2Recovered),
                        animate: false,
                      ),
                    ),
                  ],
                );
              }

              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearCases, DateTime>> _plotData(var chartData) {
    return [
      new charts.Series<LinearCases, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearCases sales, _) => sales.date,
        measureFn: (LinearCases sales, _) => sales.cases,
        data: chartData,
      )..setAttribute(charts.rendererIdKey, 'customArea'),
    ];
  }
}

class LinearCases {
  final DateTime date;
  final int cases;

  LinearCases(this.date, this.cases);
}
