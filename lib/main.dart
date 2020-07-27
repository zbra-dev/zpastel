import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zpastel/services/AuthenticationService.dart';
import 'package:zpastel/ui/PageRoutes.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

import 'model/User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        title: 'Z Pastel',
        theme: ThemeFactory().buildTheme(),
        routes: PageRoutes.build(context),
        initialRoute: PageRoutes.Base,
      ),
    );
  }
}

class ThemeFactory {
  ThemeData buildTheme() {
    return ThemeData(
      // This is the theme of your application.
      textTheme: TextThemeFactory().buildTextTheme(),
      primarySwatch: Colors.red,
      fontFamily: 'Roboto',
    );
  }
}

class TextThemeFactory {
  TextTheme buildTextTheme() {
    return ZPastelTextTheme();
  }
}

class ZPastelTextTheme extends TextTheme {
  TextStyle body = TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.textColor);
}
