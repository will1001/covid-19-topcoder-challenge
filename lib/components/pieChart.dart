import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

Widget pieChart(
    BuildContext context, List<charts.Series> seriesList, bool animate) {
  return Card(
    elevation: 9,
    child: Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.25,
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
                      measureFormatter: (num val) {
                        final oCcy = new NumberFormat("#,##0", "en_US");
                        return val == null ? '-' : ': ${oCcy.format(val)}';
                      },
                    ),
                  ],
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcWidth: 60,
                      arcRendererDecorators: [
                        new charts.ArcLabelDecorator(
                          
                        )
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
