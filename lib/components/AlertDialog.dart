import 'package:flutter/material.dart';

class ErrorPopup extends StatelessWidget {
  final Widget title;
  final Widget content;
  ErrorPopup({this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: <Widget>[
        FlatButton(onPressed: () => Navigator.pop(context), child: Text('OK'),),
      ],
    );

  }
}
