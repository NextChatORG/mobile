import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextChatLogo extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final double textSize;

  NextChatLogo({
    this.margin = const EdgeInsets.all(0.0),
    this.textSize = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: Text(
        'NextChat',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: this.textSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
