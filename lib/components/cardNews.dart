import 'package:covid19_app/API/NewsAPI.dart';
import 'package:covid19_app/routes/DetailNews.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget cardNews(BuildContext context,NewsAPI data) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Card(
      elevation: 9,
      child: Hero(
        tag: data.id,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context,"/detailNews",arguments: ScreenArguments(data));
            },
            child: ListTile(
              leading: Image.network(data.srcimg==null?"":data.srcimg, width: 100),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    timeago.format(DateTime.parse(data.publishedAt)),
                    style: TextStyle(fontSize: 12,color: Colors.black38),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
