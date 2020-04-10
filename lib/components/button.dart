import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(String title) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.cyan),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.cyanAccent.withOpacity(0.2),
    ),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(title),
    ),
  );
}
