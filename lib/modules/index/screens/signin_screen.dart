import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/modules/index/models/layout_index_view_model.dart';

class SignInScreen extends StatefulWidget {
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutIndexViewModel(
      title: 'Inicia sesión',
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
        Container(
          margin: EdgeInsets.only(
            top: 16.0,
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => ApplicationSettings.router.navigateTo(
              context,
              Routes.forgotPassword,
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Colors.grey.withAlpha(25),
              ),
            ),
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
      actionsMargin: EdgeInsets.all(0),
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
              Text('Ingresar'),
              Container(
                margin: EdgeInsets.only(
                  left: 6.0,
                ),
                child: Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => ApplicationSettings.router.navigateTo(
            context,
            Routes.signUp,
            transition: TransitionType.inFromRight,
          ),
          child: Text('Aún no tengo una cuenta'),
        ),
      ],
    );
  }
}
