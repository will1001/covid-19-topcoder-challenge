import 'package:covid19_app/API/TopCountriesAPI.dart';
import 'package:covid19_app/model/chartsPlotData.dart';
import 'package:covid19_app/components/totalCasesEachCountry.dart';
import 'package:covid19_app/components/carouselSliderNews.dart';
import 'package:covid19_app/components/mapOnDashboard.dart';
import 'package:covid19_app/components/pieChart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  ChartsPlotData plotData(String desc, String val) {
    return ChartsPlotData(desc, int.parse(val.replaceAll(",", "")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        carouselSliderNews(context),
        FutureBuilder<List<TopCountriesAPI>>(
          future: fetchTopCountriesAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data[0];

              var chartData = [
                plotData("Total Cases", data.totalCases),
                plotData("Active", data.activeCases),
                plotData("Recovery", data.totalRecovered),
                plotData("Death", data.totalDeaths),
              ];

              return pieChart(context, chartsPlotData(chartData), false);
            }

            return CircularProgressIndicator();
          },
        ),
        totalCasesEachCountry(context),
        mapOnDashboard(context)
      ],
    ));
  }
}
