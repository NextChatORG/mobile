import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/modules/index/models/layout_index_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutIndexViewModel(
      title: 'Recupera tu contraseña',
      titleSize: 24.0,
      topChildren: [
        Positioned(
          top: 6.0,
          left: 6.0,
          child: IconButton(
            onPressed: () => ApplicationSettings.router.pop(context),
            icon: Icon(Icons.keyboard_arrow_left_rounded),
            iconSize: 34.0,
          ),
        ),
      ],
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nombre de usuario',
          ),
        ),
      ],
      actions: [
        ElevatedButton(
          onPressed: () => ApplicationSettings.router.navigateTo(
            context,
            Routes.home,
            transition: TransitionType.fadeIn,
            replace: true,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continuar'),
              Container(
                margin: EdgeInsets.only(
                  left: 6.0,
                ),
                child: Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
