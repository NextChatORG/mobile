import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nextchat/widgets/nextchat.dart';
import 'package:nextchat/widgets/chat_input.dart';
import 'package:nextchat/widgets/chat_button.dart';
import 'package:nextchat/utils/requests.dart';
import 'package:nextchat/pages/login.dart';
import 'package:nextchat/pages/loader.dart';
import 'package:nextchat/database.dart';
import 'package:nextchat/models/user.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final database = DatabaseHelper.instance;

  String _username = "";
  String _password = "";
  String _repeatPassword = "";

  String _captcha;
  String _captchaAnswer = "";

  String _getCaptcha() {
    const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    Random rand = Random();

    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(rand.nextInt(chars.length))));
  }

  _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  Future<void> _onSubmit() async {
    if (_username.isEmpty) {
      _showError(AppLocalizations.of(context).register_error_0);
    } else if (_username.length < 4 || _username.length > 15) {
      _showError(AppLocalizations.of(context).register_error_1);
    } else if (_password.isEmpty) {
      _showError(AppLocalizations.of(context).register_error_2);
    } else if (_password.length < 8 || _password.length > 40) {
      _showError(AppLocalizations.of(context).register_error_3);
    } else if (_repeatPassword.isEmpty) {
      _showError(AppLocalizations.of(context).register_error_2_1);
    } else if (_repeatPassword != _password) {
      _showError(AppLocalizations.of(context).register_error_2_2);
    } else if (_captchaAnswer.isEmpty || _captcha.isEmpty) {
      _showError(AppLocalizations.of(context).register_captcha_empty);
    } else if (_captchaAnswer != _captcha) {
      _showError(AppLocalizations.of(context).register_captcha_incorrect);
    } else {
      await post(
        "users/signup",
        body: {'username': _username, 'password': _password},
        onError: (int statusCode, Map<String, dynamic> data) {
          if (statusCode == 400) {
            int code = data["code"];
            _showError((code == 0)
                ? AppLocalizations.of(context).register_error_0
                : (code == 1)
                    ? AppLocalizations.of(context).register_error_1
                    : (code == 2)
                        ? AppLocalizations.of(context).register_error_2
                        : (code == 3)
                            ? AppLocalizations.of(context).register_error_3
                            : (code == 4)
                                ? AppLocalizations.of(context).register_error_4
                                : AppLocalizations.of(context)
                                    .register_error_5);
            return;
          } else {
            _showError(AppLocalizations.of(context).server_down_error);
          }
        },
        onSuccess: (Map<String, dynamic> data) async {
          UserAccount user = UserAccount.fromMap(data);
          user.setAsCurrentAccount();

          // Save the user account on the database.
          await user.create(await database.database);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(AppLocalizations.of(context).register_success),
              duration: Duration(seconds: 2)));

          Timer(
              Duration(seconds: 2),
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoaderPage())));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _captcha = _getCaptcha();

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
                    text: AppLocalizations.of(context).register_top_button,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
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
                    NextChat(size: 48.0, margin: EdgeInsets.only(bottom: 32.0)),
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
                      margin: EdgeInsets.only(bottom: 16.0),
                      onChanged: (text) {
                        _password = text;
                      },
                    ),
                    ChatInput(
                      type: ChatInputType.password,
                      text:
                          AppLocalizations.of(context).register_repeat_password,
                      margin: EdgeInsets.only(bottom: 16.0),
                      onChanged: (text) {
                        _repeatPassword = text;
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          _captcha,
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    ChatInput(
                      type: ChatInputType.text,
                      text: AppLocalizations.of(context).register_captcha,
                      onChanged: (text) {
                        _captchaAnswer = text;
                      },
                    ),
                    ChatButton(
                      type: ChatButtonType.primary,
                      text: AppLocalizations.of(context).register_submit,
                      onPressed: () async => await _onSubmit(),
                      margin: EdgeInsets.only(top: 16.0),
                    )
                  ],
                ),
              ),
              Text(AppLocalizations.of(context).footer,
                  style: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ],
          ),
        ),
      ),
    );
  }
}
