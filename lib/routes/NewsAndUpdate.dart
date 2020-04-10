import 'package:covid19_app/components/newsList.dart';
import 'package:covid19_app/components/videoList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsAndUpdate extends StatefulWidget {
  @override
  _NewsAndUpdateState createState() => _NewsAndUpdateState();
}

class _NewsAndUpdateState extends State<NewsAndUpdate>
    with SingleTickerProviderStateMixin {
  TabController controller;

  

  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        // title: Text("Tampilan Home "),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: new Icon(FontAwesomeIcons.newspaper),
            ), 
            Tab(
              icon: new Icon(FontAwesomeIcons.youtube),
            ),
          ],
        ),
      ),
      body: TabBarView(
        //controller untuk tab bar
        controller: controller,
        children: <Widget>[
          newsList(),
          videoList(),
        ],
      ),
    );
  }
}
