import 'package:flutter/material.dart';
import 'package:nextchat/widgets/chat_button.dart';
import 'package:nextchat/database.dart';
import 'package:nextchat/models/user.dart';
import 'package:nextchat/pages/loader.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final database = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserAccount>(
          future: database.getCurrentAccount(),
          builder: (BuildContext context, AsyncSnapshot<UserAccount> snapshot) {
            if (snapshot.hasData) {
              UserAccount me = snapshot.data;
              String username = me.username;

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
                        await (await database.database).delete("user_accounts",
                            where: "id = ?", whereArgs: [me.id]);

                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoaderPage()));
                      },
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoaderPage()));
            }

            return Center(child: Text('Bienvenido!'));
          }),
    );
  }
}
