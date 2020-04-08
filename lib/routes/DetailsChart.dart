import 'package:covid19_app/API/ChartsAPI.dart';
import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:covid19_app/components/LineAreaChart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DetailsChart extends StatefulWidget {
  @override
  _DetailsChartState createState() => _DetailsChartState();
}

class _DetailsChartState extends State<DetailsChart> {
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
      body: FutureBuilder<List<ChartsAPI>>(
        future: fetchChartsAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;

            var totalCasesWorld = (String date) {
              var dataWhereDate = data.where((f) => f.date == date).toList();

              var temp = dataWhereDate
                  .map((f) {
                    return int.parse(f.cases);
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
                  convertStringToDateTime(f), totalCasesWorld(f));
            }).toList();

            return LineAreaChart(
              _plotData(chartData),
              animate: false,
            );
          }

          return CircularProgressIndicator();
        },
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
