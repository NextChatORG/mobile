import 'package:flutter/material.dart';

enum ChatInputType { text, password }

class ChatInput extends StatelessWidget {
  ChatInput(
      {Key key,
      this.type = ChatInputType.text,
      @required this.text,
      this.margin = const EdgeInsets.all(0.0),
      @required this.onChanged})
      : super(key: key);

  final ChatInputType type;
  final String text;
  final EdgeInsetsGeometry margin;

  final void Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: TextField(
        obscureText: this.type == ChatInputType.password,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            labelText: this.text,
            border: OutlineInputBorder()),
        onChanged: this.onChanged,
      ),
    );
  }
}
