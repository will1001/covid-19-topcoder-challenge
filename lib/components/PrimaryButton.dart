import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key key, this.link, this.title}) : super(key: key);

  final String link;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('$title'),
        onPressed: () {
          Navigator.pushNamed(context, '$link');
        });
  }
}
