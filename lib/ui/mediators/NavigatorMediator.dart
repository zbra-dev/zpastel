import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/ui/ItemDetailPage.dart';

class NavigationMediator {
  void popToRootPage(BuildContext context) {
    Navigator.of(context).popUntil((r) => r.isFirst);
  }

  void close(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }

  openItemDetail(BuildContext context, Flavor flavor) {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => ItemDetailPage(flavor: flavor)));
  }
}
