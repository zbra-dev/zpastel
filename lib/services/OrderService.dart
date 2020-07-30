import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/model/Pastel.dart';
import 'package:zpastel/persistence/FlavorRepository.dart';
import 'package:zpastel/persistence/OrderRepository.dart';

class OrderService {
  final FlavorRepository _flavorRepository = FlavorRepository();
  final OrderRepository _orderRepository = OrderRepository();

  Future<List<Flavor>> findAll() {
    return _flavorRepository.findAll();
  }

  Future doOrder(Order order) async {
    return await _orderRepository.save(order);
  }

  void addItem(Pastel pastel) {

  }
}
