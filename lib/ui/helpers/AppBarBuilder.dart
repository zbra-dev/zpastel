import 'package:flutter/material.dart';
import 'package:zpastel/ui/mediators/NavigatorMediator.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

class AppBarBuilder {
   final NavigationMediator _navigationMediator = NavigationMediator();
  List<Widget> actions = [];
  Text title;
  Builder leadingAction;

  AppBarBuilder withTitle(String title) {
    this.title = Text(title);
    return this;
  }

  AppBarBuilder withMenu() {
    leadingAction = Builder(
      builder: (context) => IconButton(
        icon: new Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
    return this;
  }

  AppBarBuilder withClose() {
    actions.add(Builder(
      builder: (context) => IconButton(
        icon: new Icon(Icons.close),
        onPressed: () => _navigationMediator.close(context),
      ),
    ));
    return this;
  }

  AppBarBuilder withSearch() {
    actions.add(Builder(
        builder: (context) => IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => {} /*todo*/,
            )));
    return this;
  }

  AppBar build() {
    return AppBar(
        title: title,
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: leadingAction,
        actions: actions);
  }
}
