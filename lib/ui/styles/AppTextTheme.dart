import 'package:flutter/material.dart';

import 'app-colors.dart';

class AppTextTheme {
  BuildContext _context;

  AppTextTheme(BuildContext context) {
    this._context = context;
  }

  static AppTextTheme of(BuildContext context) {
    return new AppTextTheme(context);
  }

  TextStyle get textSmall => Theme.of(this._context).textTheme.bodyText1.copyWith(fontSize: 14, fontWeight: FontWeight.normal);

  TextStyle get textSmallLight => textSmall.copyWith(fontWeight: FontWeight.w200);

  TextStyle get textSmallBold => textSmall.copyWith(fontWeight: FontWeight.bold);

  TextStyle get textDefault => Theme.of(this._context).textTheme.bodyText1.copyWith(fontSize: 16, fontWeight: FontWeight.normal);

  TextStyle get textLarge => Theme.of(this._context).textTheme.bodyText1.copyWith(color: AppColors.primaryColor, fontSize: 24);

  TextStyle get textLargeBold => textLarge.copyWith(fontWeight: FontWeight.bold);
}
