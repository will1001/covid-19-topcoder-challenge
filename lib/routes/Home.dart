import 'package:covid19_app/components/LiveReportCountry.dart';
import 'package:covid19_app/components/PrimaryButton.dart';
import 'package:covid19_app/components/carouselSliderNews.dart';
import 'package:covid19_app/components/listHospital.dart';
import 'package:covid19_app/components/mapMarkerDashboard.dart';
import 'package:covid19_app/components/pieChart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        // carouselSliderNews(context),
        // Row(
        //   children: <Widget>[
        //     pieChart(context, _createSampleData(), false),
        //     liveReportCountry(context)
        //   ],
        // ),
                    pieChart(context, _createSampleData(), false),
            liveReportCountry(context)

        // Row(
        //   children: <Widget>[
        //     listHospital(context),
        //     mapMarkerDashboard(context),
        //   ],
        // )
        //  mapMarkerDashboard(context)
        // PrimaryButton(title: "page 3",link: "/page3",)
      ],
    ));
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
