import 'dart:ui';

class AppColors {
  static double _opacity = 1;


  static Color red = new Color.fromRGBO(250, 85, 85, _opacity);

  static Color gray1 = new Color.fromRGBO(56, 56, 56, _opacity);
  static Color gray4 = new Color.fromRGBO(155, 155, 155, _opacity);
  static Color gray7 = new Color.fromRGBO(220, 220, 220, _opacity);
  static Color gray8 = new Color.fromRGBO(245, 245, 245, _opacity);
  static Color white = new Color.fromRGBO(255, 255, 255, _opacity);
  static Color smokedWhite = new Color.fromRGBO(255, 255, 255, .87);

  //
  // usages
  //
  static Color primaryColor = red;

  static Color textColor = gray1;
  static Color secondaryTextColor = gray4;
  static Color negativeTextColor = white;
  static Color secondaryNegativeTextColor = smokedWhite;

  static Color separatorColor = gray8;
}
