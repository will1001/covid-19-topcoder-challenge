import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Widget pieChart(
    BuildContext context, List<charts.Series> seriesList, bool animate) {
  return Card(
    elevation: 9,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.25,
      // decoration: BoxDecoration(color: Colors.amber),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Center(
              child: charts.PieChart(seriesList,
                  animate: animate,
                  behaviors: [
                    new charts.DatumLegend(
                      position: charts.BehaviorPosition.end,
                      horizontalFirst: false,
                      cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                      showMeasures: true,
                      legendDefaultMeasure:
                          charts.LegendDefaultMeasure.firstValue,
                      measureFormatter: (num value) {
                        return value == null ? '-' : '${value}k';
                      },
                    ),
                  ],
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcWidth: 60,
                      arcRendererDecorators: [
                        new charts.ArcLabelDecorator()
                      ]))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Text("details"),
              onTap: () {
                Navigator.pushNamed(context, '/detailsChart');
              },
            ),
          )
        ],
      ),
    ),
  );
}
