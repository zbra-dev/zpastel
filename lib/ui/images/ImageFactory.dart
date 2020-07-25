import 'package:flutter/cupertino.dart';

class ImageFactory {
  static String basePath = 'lib/ui/images/';

  static AssetImage logo() {
    return _create('zpastel_logo.png');
  }

  static AssetImage pastelBasket() {
    return _create('pastel_basket.png');
  }

  static AssetImage _create(String filename) {
    return AssetImage(basePath + filename);
  }
}
