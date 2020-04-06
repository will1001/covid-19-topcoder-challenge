import 'package:covid19_app/components/HeaderAppBar.dart';
// import 'package:covid19_app/components/PrimaryButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: HeaderAppBar()),
      body: Column(
        children: <Widget>[
        Text("data")
        ],
      )
      // body: FutureBuilder<List<TestAPI>>(
      //   future: fetchTestAPI(),
      //   builder: (context, snapshot) {
      //     // var a = snapshot.data.map((f) {
      //     //   return f.title.toString();
      //     // }).toList();
      //     // print(a);
      //     // print(snapshot.data.articles[0]["author"]);
      //     if (snapshot.hasData) {
      //       // return SafeArea(
      //       //     child: SingleChildScrollView(
      //       //   scrollDirection: Axis.horizontal,
      //       //   child: Row(
      //       //     children: <Widget>[
      //       //       Container(
      //       //         width: 1000,
      //       //         height: 1000,
      //       //         // color: Colors.green,
      //       //         child: SimpleBarChart(
      //       //   _createSampleData(),
      //       //   // Disable animations for image tests.
      //       //   animate: true,
      //       // ),
      //       //       )
      //       //     ],
      //       //   ),
      //       // ));
      //       return YoutubePlayer(
      //         controller: _controller,
      //         showVideoProgressIndicator: true,
      //         progressIndicatorColor: Colors.amber,
      //         progressColors: ProgressBarColors(
      //             playedColor: Colors.amber, handleColor: Colors.amberAccent),
      //         onReady: () {
      //           //  _controller.addListener(listener)
      //         },
      //       );
      //     } else if (snapshot.hasError) {
      //       return Text("${snapshot.error}");
      //     }

      //     return CircularProgressIndicator();
      //   },
      // ),
    );
  }

  // static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
  //   final data = [
  //     new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
  //     new TimeSeriesSales(new DateTime(2017, 9, 20), 15),
  //     new TimeSeriesSales(new DateTime(2017, 9, 21), 25),
  //     new TimeSeriesSales(new DateTime(2017, 9, 22), 35),
  //     new TimeSeriesSales(new DateTime(2017, 9, 23), 25),
  //     new TimeSeriesSales(new DateTime(2017, 9, 24), 15),
  //     new TimeSeriesSales(new DateTime(2017, 9, 25), 5),
  //     new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
  //     new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
  //     new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
  //   ];

  //   return [
  //     new charts.Series<TimeSeriesSales, DateTime>(
  //       id: 'Sales',
  //       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //       domainFn: (TimeSeriesSales sales, _) => sales.time,
  //       measureFn: (TimeSeriesSales sales, _) => sales.sales,
  //       data: data,
  //     )
  //   ];
  // }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
