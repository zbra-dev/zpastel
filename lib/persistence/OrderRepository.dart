import 'package:zpastel/model/Order.dart';
import 'package:zpastel/persistence/store/FirestoreStore.dart';

import 'converters/OrderConverter.dart';

class OrderRepository {
  FirestoreStore<Order> _store;

  OrderRepository() {
    this._store = new FirestoreStore.entity(new Order(), OrderConverter());
  }

  Future<void> save(order) async {
    await _store.save(order);
  }
}
