import 'package:zpastel/model/Flavor.dart';

import 'StorableEntity.dart';

abstract class Item implements StorableEntity {
  int orderId;
  int quantity;
  Flavor flavor;
}

