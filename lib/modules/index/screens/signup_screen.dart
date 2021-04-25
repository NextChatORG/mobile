import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/modules/index/models/layout_index_view_model.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutIndexViewModel(
      title: 'Registro',
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
          margin: EdgeInsets.only(
            top: 16.0,
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Repite la contraseña',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 12.0,
            left: 6.0,
          ),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12.0,
              ),
              children: [
                TextSpan(
                  text: "Presionando el botón de abajo estarás de acuerdo con nuestros ",
                ),
                TextSpan(
                  text: "Términos de Servicio",
                  style: TextStyle(color: Colors.indigo),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { },
                ),
                TextSpan(
                  text: " y nuestra ",
                ),
                TextSpan(
                  text: "Política de Privacidad",
                  style: TextStyle(color: Colors.indigo),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { },
                ),
                TextSpan(text: "."),
              ],
            ),
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
              Text('Finalizar'),
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
            Routes.signIn,
            transition: TransitionType.inFromRight,
          ),
          child: Text('Ya tengo una cuenta'),
        ),
      ],
    );
  }
}
