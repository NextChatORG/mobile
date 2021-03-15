
import 'package:flutter/material.dart';
import 'package:nextchat/screens/home/home_screen.dart';
import 'package:nextchat/screens/messages/messages_screen.dart';
import 'package:nextchat/screens/notifications/notifications_screen.dart';
import 'package:nextchat/screens/profile/profile_screen.dart';
import 'package:nextchat/screens/signInOrSignUp/signin_screen.dart';
import 'package:nextchat/screens/signInOrSignUp/signup_screen.dart';
import 'package:nextchat/screens/signInOrSignUp/welcome_screen.dart';

class Routes extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    // SignInOrSignUp
    "/welcome": (BuildContext context) => WelcomeScreen(),
    "/signin": (BuildContext context) => SignInScreen(),
    "/signup": (BuildContext context) => SignUpScreen(),

    // Logged
    "/home": (BuildContext context) => HomeScreen(),
    "/messages": (BuildContext context) => MessagesScreen(),
    "/notifications": (BuildContext context) => NotificationsScreen(),
    "/profile": (BuildContext context) => ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextChat',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: routes,
    );
  }
}
