import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';
import 'package:nextchat/modules/index/models/layout_index_view_model.dart';
import 'package:nextchat/widgets/nextchat_logo.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.60;

    return LayoutIndexViewModel(
      withLogoAndTitle: false,
      children: [
        SvgPicture.asset(
          'assets/images/begin_chat.svg',
          width: imageSize,
          height: imageSize,
        ),
        NextChatLogo(
          margin: EdgeInsets.only(
            top: 36.0,
          ),
        ),
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
      actionsMargin: EdgeInsets.only(
        top: 36.0,
      ),
      actions: [
        ElevatedButton(
          onPressed: () => ApplicationSettings.router.navigateTo(
            context,
            Routes.signUp,
            transition: TransitionType.inFromRight,
          ),
          child: Text('Soy nuevo aquí'),
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
