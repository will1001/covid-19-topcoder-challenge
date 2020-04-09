import 'package:charts_flutter/flutter.dart' as charts;


List<charts.Series<ChartsPlotData, String>> chartsPlotData(
      var chartData) {
    return [
      new charts.Series<ChartsPlotData, String>(
        id: 'value',
        colorFn: (ChartsPlotData segment, _) {
          switch (segment.description) {
            case "Active":
              {
                return charts.MaterialPalette.yellow.shadeDefault;
              }

            case "Recovery":
              {
                return charts.MaterialPalette.green.shadeDefault;
              }

            case "Death":
              {
                return charts.MaterialPalette.red.shadeDefault;
              }
            default:
              {
                return charts.MaterialPalette.blue.shadeDefault;
              }
          }
        },
        domainFn: (ChartsPlotData value, _) => value.description,
        measureFn: (ChartsPlotData value, _) => value.value,
        data: chartData,
        labelAccessorFn: (ChartsPlotData row, _) => '${row.description}',
      )
    ];
  }

class ChartsPlotData {
  final String description;
  final int value;

  ChartsPlotData(this.description, this.value);
}