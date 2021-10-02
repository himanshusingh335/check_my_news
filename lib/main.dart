import 'package:check_my_news/injector.dart';
import 'package:flutter/material.dart';

import 'package:check_my_news/screens/splash_screen.dart';

void main() {
  /// Register dependency injections
  setupInjector();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check My News',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
