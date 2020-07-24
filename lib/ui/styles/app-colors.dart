import 'dart:ui';

class AppColors {
  static double _opacity = 1;


  static Color red = new Color.fromRGBO(249, 75, 75, _opacity);

  static Color gray1 = new Color.fromRGBO(49, 49, 49, _opacity);
  static Color gray4 = new Color.fromRGBO(147, 147, 147, _opacity);
  static Color gray7 = new Color.fromRGBO(220, 220, 220, _opacity);
  static Color gray8 = new Color.fromRGBO(243, 243, 243, _opacity);
  static Color white = new Color.fromRGBO(255, 255, 255, _opacity);

  //
  // usages
  //
  static Color primaryColor = red;

  static Color textColor = gray1;
  static Color secondaryTextColor = gray4;
  static Color negativeTextColor = white;
  static Color secondaryNegativeTextColor = gray7;

  static Color separatorColor = gray8;
}
