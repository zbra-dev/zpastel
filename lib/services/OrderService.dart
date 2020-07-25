import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/persistence/FlavorRepository.dart';

class OrderService {
  final FlavorRepository _flavorRepository = FlavorRepository();

  Future<List<Flavor>> findAll() {
    return _flavorRepository.findAll();
  }

  void doOrder(Order order) {
    // send message in Slack
  }
}
