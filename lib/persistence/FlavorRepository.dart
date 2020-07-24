import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/persistence/store/FirestoreStore.dart';

import 'converters/FlavorConverter.dart';

class FlavorRepository {
  FirestoreStore<Flavor> _store;

  FlavorRepository() {
    _store = new FirestoreStore.entity(new Flavor(), FlavorConverter());
  }

  Future<List<Flavor>> findAll() async {
    return await _store.findAll();
  }
}
