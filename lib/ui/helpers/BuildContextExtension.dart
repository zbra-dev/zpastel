import 'package:flutter/widgets.dart';

extension RelativeViewSize on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;

  double get deviceHeight => MediaQuery.of(this).size.height;

  double widthSize(double percentage) {
    return _calculatePercentageOf(MediaQuery.of(this).size.width, percentage);
  }

  double heightSize(double percentage) {
    return _calculatePercentageOf(MediaQuery.of(this).size.height, percentage);
  }

  double _calculatePercentageOf(double total, double value) {
    if (value >= 0 && value <= 100) {
      return total * value / 100;
    }
    return 0;
  }

  bool isPortraitOrientation() {
    return MediaQuery.of(this).orientation == Orientation.portrait;
  }
}
