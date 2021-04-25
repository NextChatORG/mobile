import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nextchat/config/routes/routes.dart';
import 'package:nextchat/core/settings/apllication_settings.dart';

class MainApp extends StatelessWidget {
  MainApp() {
    // Configure app routes.
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);

    ApplicationSettings.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextChat',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: ApplicationSettings.router.generator,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primarySwatch: Colors.indigo,
        accentColor: Colors.deepPurple,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.indigo,
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es'),
        Locale('en'),
      ],
    );
  }
}
