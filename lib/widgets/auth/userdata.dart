import 'package:flutter/material.dart';
import 'package:nextchat/database.dart';
import 'package:nextchat/models/user.dart';
import 'package:nextchat/websocket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum UserDataError { UserAccount, WebSocketChannel }

class UserData extends StatelessWidget {
  UserData({Key key, @required this.child, @required this.error})
      : super(key: key);

  final Widget Function(UserAccount me, WebSocketChannel channel) child;
  final Widget Function(UserDataError type) error;

  final _database = DatabaseHelper.instance;
  final _websockets = WebSocketHelper.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserAccount>(
      future: _database.getCurrentAccount(),
      builder: (BuildContext context, AsyncSnapshot<UserAccount> snapshot) {
        if (snapshot.hasData) {
          UserAccount me = snapshot.data;
          return FutureBuilder<WebSocketChannel>(
            future: _websockets.channel,
            builder: (BuildContext context,
                AsyncSnapshot<WebSocketChannel> snapshot) {
              if (snapshot.hasData) {
                return child(me, snapshot.data);
              }

              return error(UserDataError.WebSocketChannel);
            },
          );
        }

        return error(UserDataError.UserAccount);
      },
    );
  }
}
