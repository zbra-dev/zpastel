import 'package:flutter/material.dart';
import 'package:zpastel/ui/BasePage.dart';
import 'package:zpastel/ui/SelectItemsPage.dart';

import 'LoginPage.dart';

class PageRoutes {
  static build(BuildContext context) {
    return <String, WidgetBuilder>{
      PageRoutes.Base: (context) => BasePage(),
      PageRoutes.Login: (context) => LoginPage(),
      PageRoutes.SelectItems: (context) => SelectItemPage(),
    };
  }

  static const String Base = '/';
  static const String Login = '/Login';
  static const String SelectItems = '/SelectItems';
}
