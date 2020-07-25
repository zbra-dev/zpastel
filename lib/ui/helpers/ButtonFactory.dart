import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zpastel/ui/helpers/BuildContextExtension.dart';

class ButtonFactory {
  static ShapeBorder defaultBorderShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    );
  }


  static EdgeInsets defaultPaddingStatic() {
    return EdgeInsets.symmetric(
      vertical:20,
      horizontal: 50,
    );
  }

  static EdgeInsets defaultPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      vertical: context.heightSize(2),
      horizontal: context.widthSize(12),
    );
  }

  static double defaultElevation() {
    return 5;
  }

  static borderlessShape() {
    return RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent, width: 0),
    );
  }
}
