import 'package:flutter/material.dart';
import 'package:zpastel/ui/PageRoutes.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZPastel',
      theme: ThemeFactory().buildTheme(),
      routes: PageRoutes.build(context),
      // initialRoute: '/',
      initialRoute: '/SelectItems',
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
  TextStyle body = TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.textColor);
}
