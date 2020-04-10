import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  HeaderAppBar({this.title, this.bgColor, this.backIconColor});
  final String title;
  final Color bgColor;
  final Color backIconColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: backIconColor),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      title: Text(title == null ? '' : title),
      backgroundColor: bgColor,
      elevation: 0,
    );
  }
}
