import 'package:covid19_app/routes/DetailNews.dart';
import 'package:covid19_app/routes/DetailsChart.dart';
import 'package:covid19_app/routes/FullScreenMap.dart';
import 'package:covid19_app/routes/Home.dart';
import 'package:covid19_app/routes/NewsAndUpdate.dart';
import 'package:covid19_app/routes/ReportsByCountry.dart';
import 'package:covid19_app/routes/SplashScreen.dart';
// import 'package:covid19_app/routes/Page2.dart';
import 'package:covid19_app/routes/Page3.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(title: 'Flutter Demo Home Page'),
        '/reportsByCountry': (context) => ReportsByCountry(),
        '/detailsChart': (context) => DetailsChart(),
        '/newsAndUpdate': (context) => NewsAndUpdate(),
        '/fullScreenMap': (context) => FullScreenMap(),
        '/detailNews': (context) => DetailNews(),
        // '/page2': (context) => Page2(),
        // '/page3': (context) => Page3(),
      },
    );
  }
}
