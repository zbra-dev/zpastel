import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/model/Pastel.dart';
import 'package:zpastel/persistence/FlavorRepository.dart';

class OrderService {
  final FlavorRepository _flavorRepository = FlavorRepository();

  Future<List<Flavor>> findAll() {
    return _flavorRepository.findAll();
  }

  Future doOrder(Order order) async {
    // send message in Slack
  }

  void addItem(Pastel pastel) {

  }
}
