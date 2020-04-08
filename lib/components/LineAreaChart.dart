import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineAreaChart extends StatelessWidget {
  LineAreaChart(this.seriesList, {this.animate});

  final List<charts.Series> seriesList;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
        animate: animate,
        customSeriesRenderers: [
          new charts.LineRendererConfig(
              customRendererId: 'customArea', includeArea: true, stacked: true),
        ]);
  }
}
