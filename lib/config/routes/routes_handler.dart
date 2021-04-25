import 'package:fluro/fluro.dart';
import 'package:nextchat/modules/home/screens/chat_screen.dart';
import 'package:nextchat/modules/home/screens/chats_screen.dart';
import 'package:nextchat/modules/home/screens/home_screen.dart';
import 'package:nextchat/modules/home/screens/notifications_screen.dart';
import 'package:nextchat/modules/home/screens/profile_screen.dart';
import 'package:nextchat/modules/index/screens/forgot_password_screen.dart';
import 'package:nextchat/modules/index/screens/signin_screen.dart';
import 'package:nextchat/modules/index/screens/signup_screen.dart';
import 'package:nextchat/modules/index/screens/welcome_screen.dart';
import 'package:nextchat/modules/splash_screen/screens/splash_screen.dart';

class RoutesHandler {
  static Handler rootHandler =
      Handler(
        handlerFunc: (context, _params) => SplashScreen(),
      );

  static Handler welcomeHandler =
      Handler(
        handlerFunc: (context, _params) => WelcomeScreen(),
      );

  static Handler signInHandler =
      Handler(
        handlerFunc: (context, _params) => SignInScreen(),
      );

  static Handler forgotPasswordHandler =
      Handler(
        handlerFunc: (context, _params) => ForgotPasswordScreen(),
      );

  static Handler signUpHandler =
      Handler(
        handlerFunc: (context, _params) => SignUpScreen(),
      );

  static Handler homeHandler =
      Handler(
        handlerFunc: (context, _params) => HomeScreen(),
      );

  static Handler chatsHandler =
      Handler(
        handlerFunc: (context, _params) => ChatsScreen(),
      );

  static Handler chatHandler =
      Handler(
        handlerFunc: (context, params) {
          String username = params['username']?.first;
          return ChatScreen(username);
        },
      );

  static Handler notificationsHandler =
      Handler(
        handlerFunc: (context, _params) => NotificationsScreen(),
      );

  static Handler profileHandler =
      Handler(
        handlerFunc: (context, params) {
          String username = params['username']?.first;
          return ProfileScreen(username);
        },
      );
}
