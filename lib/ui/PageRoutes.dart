import 'package:flutter/material.dart';
import 'package:zpastel/ui/SelectItemsPage.dart';

class PageRoutes {
  static build(BuildContext context) {
    return <String, WidgetBuilder> {
      // Routes.Base: (context) => BasePage(),
      PageRoutes.SelectItems: (context) => SelectItemPage(),
      // TODO: register other pages here
    };
  }

  static const String Base = '/';
  static const String SelectItems = '/SelectItems';
}
