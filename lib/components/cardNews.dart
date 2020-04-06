import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget cardNews(String title, String srcimg) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: Image.network(srcimg, width: 100),
      title: Text(
        title,
        style: TextStyle(fontSize: 12),
      ),
    ),
  );
}
