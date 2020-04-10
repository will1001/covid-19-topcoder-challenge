import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:covid19_app/model/currentLocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: const Size(double.infinity, kToolbarHeight),
      //     child: HeaderAppBar(bgColor: Colors.white,)),
      body: Stack(
        children: <Widget>[
          currentLocation(),
          Container(
            child: HeaderAppBar(
              bgColor: Colors.transparent,
              backIconColor: Colors.black,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],
      ),
    );
  }
}
