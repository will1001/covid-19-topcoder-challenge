import 'package:covid19_app/API/NewsAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

Widget boxShareIcon(BuildContext context,NewsAPI data) {
  return Stack(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              boxIcon(FontAwesomeIcons.share,data.url),
              boxIcon(FontAwesomeIcons.comment,data.url),
            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 60),
        height: MediaQuery.of(context).size.height * 0.03,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget boxIcon(IconData icon,String link) {
  return IconButton(
      icon: FaIcon(
        icon,
        color: Colors.white54,
        size: 17,
      ),
      onPressed: () {
        Share.share('$link');
      });
}
