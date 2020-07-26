import 'package:zpastel/model/Flavor.dart';

import 'StorableEntity.dart';

abstract class Item implements StorableEntity {
  String orderId;
  int qtdy;
  Flavor flavor;
}

