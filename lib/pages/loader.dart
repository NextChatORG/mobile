import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nextchat/widgets/nextchat.dart';
import 'package:nextchat/database.dart';
import 'package:nextchat/pages/login.dart';
import 'package:nextchat/pages/home.dart';

class LoaderPage extends StatefulWidget {
  @override
  _LoaderPageState createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {
  final database = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();

    database.getCurrentAccount().then((account) {
      Widget page;
      if (account == null) {
        page = LoginPage();
      } else {
        page = HomePage();
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => page));
    }).catchError((e) {
      print('Database Error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          NextChat(size: 48.0, margin: EdgeInsets.only(bottom: 2.0)),
          Text(AppLocalizations.of(context).loader_message,
              style: TextStyle(color: Colors.grey, fontSize: 12.0))
        ]));
  }
}
