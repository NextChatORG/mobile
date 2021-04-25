import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nextchat/config/routes/routes_handler.dart';

class Routes {
  static String root = '/';

  static String welcome = '/welcome';
  static String signIn = '/signin';
  static String forgotPassword = '/forgot_password';
  static String signUp = '/signup';

  static String home = '/home';
  static String chats = '/chats';
  static String chat = '/chat';
  static String notifications = '/notifications';
  static String profile = '/profile';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('Route was not found!');
        return;
      },
    );

    router.define(
      root,
      handler: RoutesHandler.rootHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(welcome, handler: RoutesHandler.welcomeHandler);
    router.define(signIn, handler: RoutesHandler.signInHandler);
    router.define(
      forgotPassword,
      handler: RoutesHandler.forgotPasswordHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(signUp, handler: RoutesHandler.signUpHandler);

    router.define(home, handler: RoutesHandler.homeHandler);
    router.define(chats, handler: RoutesHandler.chatsHandler);
    router.define(
      "$chat/:username",
      handler: RoutesHandler.chatHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(notifications, handler: RoutesHandler.notificationsHandler);
    router.define("$profile/:username", handler: RoutesHandler.profileHandler);
  }
}
