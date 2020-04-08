import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listHospital(BuildContext context) {
  return Card(
    elevation: 9,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.33,
      // decoration: BoxDecoration(color: Colors.amber),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hospital Near You :"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(Icons.plus_one),
                    ),
                    Text("Puskesmas Kerongkong")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("2.0 km"),
                    Icon(
                      Icons.arrow_drop_up,
                      color: Colors.red,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.network(
                        "https://www.worldometers.info/img/flags/us-flag.gif",
                        width: 18,
                        height: 18,
                      ),
                    ),
                    Text("USA")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("123,456"),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.green,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
