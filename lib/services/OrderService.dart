import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/persistence/FlavorRepository.dart';

class OrderService {
  final FlavorRepository _flavorRepository = FlavorRepository();

  Future<List<Flavor>> findAll() {
    return _flavorRepository.findAll();
  }
}
