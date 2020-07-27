import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/ui/ItemDetailPage.dart';
import 'package:zpastel/ui/PageRoutes.dart';

import '../ReviewOrderPage.dart';

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

  void openLogin(BuildContext context) {
    Navigator.of(context).pushNamed(PageRoutes.Login);
  }

  void openHome(BuildContext context) {
    Navigator.of(context).pushNamed(PageRoutes.SelectItems);
  }

  void openItemDetail(BuildContext context, Flavor flavor, Order currentOrder) {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => ItemDetailPage(flavor: flavor, currentOrder: currentOrder)));
  }

  void openReviewOrder(BuildContext context, Order order) {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => ReviewOrderPage(currentOrder: order)));
  }

  openManualSignIn(BuildContext context) {
    Navigator.of(context).pushNamed(PageRoutes.ManualSignIn);
  }
}
