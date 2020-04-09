import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  HeaderAppBar({this.title,this.bgColor});
  final String title;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title==null?'':title),
      backgroundColor: bgColor,
      elevation: 0,
    );
  }
}
