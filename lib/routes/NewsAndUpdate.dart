import 'package:covid19_app/API/NewsAPI.dart';
import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:covid19_app/components/cardNews.dart';
import 'package:flutter/material.dart';

class NewsAndUpdate extends StatefulWidget {
  @override
  _NewsAndUpdateState createState() => _NewsAndUpdateState();
}

class _NewsAndUpdateState extends State<NewsAndUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: HeaderAppBar()),
      body: FutureBuilder<List<NewsAPI>>(
        future: fetchNewsAPI(),
        builder: (context, snapshot) {
          // var a = snapshot.data.map((f) {
          //   return f.title;
          // });
          // print(a);

          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data.map((f) {
                return cardNews(context,f);
              }).toList(),
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
