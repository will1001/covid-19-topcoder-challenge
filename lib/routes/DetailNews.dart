import 'package:covid19_app/API/NewsAPI.dart';
import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailNews extends StatefulWidget {
  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
  NewsAPI data = args.datas;
    timeDilation = 3.0;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: HeaderAppBar()),
      body: ListView(
        children: <Widget>[
          Image.network(data.srcimg),
          Text(data.title),
        ],
      ),
    );
  }
}


class ScreenArguments {
  final NewsAPI datas;

  ScreenArguments(this.datas);
}