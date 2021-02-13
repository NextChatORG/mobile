import 'package:flutter/material.dart';
import 'package:nextchat/websocket.dart';
import 'package:nextchat/widgets/auth/userdata.dart';
import 'package:nextchat/widgets/chat_button.dart';
import 'package:nextchat/widgets/bottom_navigation.dart';
import 'package:nextchat/database.dart';
import 'package:nextchat/models/user.dart';
import 'package:nextchat/pages/loader.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _database = DatabaseHelper.instance;
  final _websockets = WebSocketHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserData(
        child: (UserAccount me, WebSocketChannel channel) {
          String username = me.username;

          channel.sink.add('/connection $username');

          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('@$username bienvenido!'),
                ChatButton(
                  type: ChatButtonType.primary,
                  text: 'Salir',
                  onPressed: () async {
                    _websockets.close();

                    await (await _database.database).delete("user_accounts",
                        where: "id = ?", whereArgs: [me.id]);

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoaderPage()));
                  },
                )
              ],
            ),
          );
        },
        error: (UserDataError type) {
          return Text('Error');
        },
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 0),
    );
  }
}
