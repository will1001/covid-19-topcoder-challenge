import 'package:covid19_app/API/ReportByCountryAPI.dart';
import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:flutter/material.dart';

class ReportsByCountry extends StatefulWidget {
  @override
  _ReportsByCountryState createState() => _ReportsByCountryState();
}

class _ReportsByCountryState extends State<ReportsByCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: HeaderAppBar()),
      body: FutureBuilder<List<ReportByCountryAPI>>(
        future: fetchReportByCountryAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data.reversed.map((f) {
                return ExpansionTile(
                  leading: Image.network(
                    f.flag,
                    width: 24,
                    height: 24,
                  ),
                  title: Text(f.country),
                  // trailing: Text(f.cases.toString()),
                  children: <Widget>[
                    ListTile(
                      title: Text("Total Cases"),
                      trailing: Text(f.cases.toString()),
                    ),
                    ListTile(
                      title: Text("Active Cases"),
                      trailing: Text(f.active.toString()),
                    ),
                    ListTile(
                      title: Text("Recovered"),
                      trailing: Text(f.recovered.toString()),
                    ),
                    ListTile(
                      title: Text("Deaths"),
                      trailing: Text(f.deaths.toString()),
                    ),
                  ],
                );
              }).toList(),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
