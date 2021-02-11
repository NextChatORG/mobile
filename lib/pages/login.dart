import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nextchat/widgets/nextchat.dart';
import 'package:nextchat/widgets/chat_input.dart';
import 'package:nextchat/widgets/chat_button.dart';
import 'package:nextchat/models/user.dart';
import 'package:nextchat/utils/requests.dart';
import 'package:nextchat/database.dart';
import 'package:nextchat/pages/loader.dart';
import 'package:nextchat/pages/register.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final database = DatabaseHelper.instance;

  String _username = "";
  String _password = "";

  _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  Future<void> _onSubmit() async {
    if (_username.isEmpty) {
      _showError(AppLocalizations.of(context).login_error_0);
      return;
    } else if (_password.isEmpty) {
      _showError(AppLocalizations.of(context).login_error_1);
      return;
    }

    await post("users/signin",
        body: {'username': _username, 'password': _password},
        onError: (int statusCode, Map<String, dynamic> data) {
      if (statusCode == 400) {
        int code = data["code"];
        _showError(code == 0
            ? AppLocalizations.of(context).login_error_0
            : code == 1
                ? AppLocalizations.of(context).login_error_1
                : code == 2
                    ? AppLocalizations.of(context).login_error_2
                    : AppLocalizations.of(context).login_error_3);
      } else {
        _showError(AppLocalizations.of(context).server_down_error);
      }
    }, onSuccess: (Map<String, dynamic> data) async {
      UserAccount user = UserAccount.fromMap(data);
      user.setAsCurrentAccount();

      // Save the user account on the database.
      await user.create(await database.database);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(AppLocalizations.of(context).login_success),
          duration: Duration(seconds: 2)));

      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => LoaderPage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ChatButton(
                    type: ChatButtonType.text,
                    text: AppLocalizations.of(context).login_top_button,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RegisterPage()));
                    },
                    margin: EdgeInsets.only(right: 32.0, top: 48.0),
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NextChat(
                      size: 48.0,
                      margin: EdgeInsets.only(bottom: 32.0),
                    ),
                    ChatInput(
                      text: AppLocalizations.of(context).form_username,
                      margin: EdgeInsets.only(bottom: 16.0),
                      onChanged: (text) {
                        _username = text;
                      },
                    ),
                    ChatInput(
                      type: ChatInputType.password,
                      text: AppLocalizations.of(context).form_password,
                      margin: EdgeInsets.only(bottom: 8.0),
                      onChanged: (text) {
                        _password = text;
                      },
                    ),
                    ChatButton(
                      type: ChatButtonType.text,
                      text: AppLocalizations.of(context).login_forgot_account,
                      onPressed: () {},
                      style: TextStyle(fontSize: 12.0),
                    ),
                    ChatButton(
                      type: ChatButtonType.primary,
                      text: AppLocalizations.of(context).login_submit,
                      onPressed: () async => await _onSubmit(),
                      margin: EdgeInsets.only(top: 16.0),
                    )
                  ],
                ),
              ),
              Text(
                AppLocalizations.of(context).footer,
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
