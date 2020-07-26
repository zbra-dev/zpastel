import 'package:flutter/material.dart';
import 'package:zpastel/ui/SelectItemsPage.dart';

import 'CartPage.dart';
import 'LoginPage.dart';

class PageRoutes {
  static build(BuildContext context) {
    return <String, WidgetBuilder>{
      PageRoutes.Login: (context) => LoginPage(),
      PageRoutes.SelectItems: (context) => SelectItemPage(),
      PageRoutes.Cart: (context) => CartPage(),
    };
  }

  static const String Base = '/';
  static const String Login = '/Login';
  static const String SelectItems = '/SelectItems';
  static const String Cart = '/Cart';
}
