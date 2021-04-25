import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/utils/services/storage_service.dart';
import 'package:nextchat/widgets/nextchat_logo.dart';

class SplashScreen extends StatelessWidget {
  void _redirectTo(BuildContext context, String route) {
    ApplicationSettings.router.navigateTo(
      context,
      route,
      transition: TransitionType.fadeIn,
      replace: true,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => StorageService.isLogged().then((value) => this._redirectTo(
      context,
      (value) ? Routes.home : Routes.welcome,
    ), onError: (e) => this._redirectTo(context, Routes.welcome)));

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NextChatLogo(),
              Container(
                margin: EdgeInsets.only(
                  top: 2.0,
                ),
                child: Text(
                  '¡Conecta con otras personas al instante!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
