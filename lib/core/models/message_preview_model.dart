import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextchat/modules/home/models/message_preview_widget_model.dart';

class MessagePreviewModel {
  String _avatar;
  String _username;

  int _messagesCount;
  String _lastMessage;

  DateTime _date;

  MessagePreviewModel({
    @required String avatar,
    @required String username,
    int messagesCount = 0,
    String lastMessage = '',
    DateTime date,
  }) {
    this._avatar = avatar;
    this._username = username;

    this._messagesCount = messagesCount;
    this._lastMessage = lastMessage;

    this._date = date ?? DateTime.now();
  }

  String getAvatar() => this._avatar;
  String getUsername() => this._username;

  int getMessagesCount() => this._messagesCount;
  String getLastMessage() => this._lastMessage;

  String getDate() {
    DateTime now = DateTime.now();
    Duration diff = now.difference(this._date);

    if (diff.inDays >= 2) {
      return DateFormat(
        "dd-MM${(this._date.year == now.year) ? '' : '-y'}",
      ).format(this._date);
    } else if (diff.inDays == 1) {
      return 'Ayer';
    }

    return DateFormat.jm().format(this._date);
  }

  Widget getAvatarWidget(double size) {
    return Image.asset(
      this.getAvatar(),
      width: size,
      height: size,
    );
  }

  Widget toWidget({
    MessagePreviewType type = MessagePreviewType.Chats,
    void Function() onPressed,
  }) {
    return MessagePreviewWidgetModel(
      type,
      this,
      onPressed: onPressed,
    );
  }
}
