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

  TextStyle get textSmall => Theme.of(this._context).textTheme.bodyText1.copyWith(fontSize: 13, fontWeight: FontWeight.normal);

  TextStyle get textSmallLight => textSmall.copyWith(fontWeight: FontWeight.w200);

  TextStyle get textDefault => Theme.of(this._context).textTheme.bodyText1.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.textColor);

  TextStyle get textDefaultLight => textDefault.copyWith(fontWeight: FontWeight.w200);

  TextStyle get textDefaultBold => textDefault.copyWith(fontWeight: FontWeight.bold);

  TextStyle get textLarge => Theme.of(this._context).textTheme.bodyText1.copyWith(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.textColor);

  TextStyle get textLargeBold => textLarge.copyWith(fontWeight: FontWeight.bold);
}
