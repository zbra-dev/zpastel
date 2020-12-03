
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zpastel/gateway/AppContextGateway.dart';
import 'package:zpastel/model/User.dart';
import 'package:zpastel/ui/SelectItemsPage.dart';

import 'LoginPage.dart';

class BasePage extends StatelessWidget {
  final appContext = new AppContextGateway();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return LoginPage();
    } else {
      _validateStoredUser(user);
      return SelectItemPage();
    }
  }

  Future _validateStoredUser(User user) async {
    var userId = await appContext.getUserId();
    if (userId == null || userId != user.id) {
      //TODO: fix this
      //appContext.setUserId(user.id);
    }
  }
}
