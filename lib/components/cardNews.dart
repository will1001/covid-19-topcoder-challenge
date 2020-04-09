import 'package:covid19_app/API/NewsAPI.dart';
import 'package:covid19_app/routes/DetailNews.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget cardNews(BuildContext context,NewsAPI data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Hero(
      tag: data.id,
      child: Material(
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context,"/detailNews",arguments: ScreenArguments(data));
          },
          child: ListTile(
            leading: Image.network(data.srcimg, width: 100),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
