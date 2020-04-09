import 'package:covid19_app/API/TopCountriesAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget liveReportCountry(BuildContext context) {
  return Card(
    elevation: 9,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.25,
      // decoration: BoxDecoration(color: Colors.amber),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<TopCountriesAPI>>(
          future: fetchTopCountriesAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Total Cases Every Country :"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: data
                              .map((f) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Image.network(
                                            f.flag,
                                            width: 18,
                                            height: 18,
                                          ),
                                        ),
                                        Text(
                                          "  "+f.country,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          f.totalCases+"  ",
                                        ),
                                        Icon(
                                          Icons.person_outline,
                                          size: 17,
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              })
                              .toList()
                              .getRange(1, 5)
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text("more"),
                      onTap: () {
                        Navigator.pushNamed(context, '/reportsByCountry');
                      },
                    ),
                  )
                ],
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    ),
  );
}
