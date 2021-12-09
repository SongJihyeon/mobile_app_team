import 'package:flutter/material.dart';
import 'login.dart';

class ShowApp extends StatelessWidget {
  const ShowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show information',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFFA0A0FF),
        ),
      ),
      home: const LoginPage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}