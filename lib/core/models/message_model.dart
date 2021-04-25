import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextchat/modules/home/models/message_widget_model.dart';

enum MessageFrom {
  Other,
  Me,
}

class MessageModel {
  MessageFrom _from;
  String _content;

  DateTime _date;

  bool _seen;

  MessageModel({
    MessageFrom from = MessageFrom.Me,
    String content = '',
    DateTime date,
    bool seen = false,
  }) {
    this._from = from;
    this._content = content;
    this._date = date ?? DateTime.now();
    this._seen = seen;
  }

  MessageFrom getFrom() => this._from;
  bool isFromMe() => this._from == MessageFrom.Me;
  bool isFromOther() => this._from == MessageFrom.Other;
  String getContent() => this._content;

  String getDate() => DateFormat.jm().format(this._date);

  bool isSeen() => this._seen;

  Widget toWidget({
    void Function() onLongPress,
    EdgeInsetsGeometry margin = const EdgeInsets.all(0.0),
  }) {
    return MessageWidgetModel(
      this,
      onLongPress: onLongPress,
      margin: margin,
    );
  }
}
