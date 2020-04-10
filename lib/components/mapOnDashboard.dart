import 'package:covid19_app/model/currentLocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mapOnDashboard(BuildContext context) {
  return Card(
    elevation: 9,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hospital Near You"),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.33,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                currentLocation(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.fullscreen,
                        size: 45,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/fullScreenMap');
                      }),
                ), //;
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
