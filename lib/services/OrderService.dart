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
    order.totalPrice = calculateTotalPrice(order.orderItems);
    return await _orderRepository.save(order);
  }

  double calculateTotalPrice(List<Pastel> orderItems){
    return orderItems.map((o) => o.quantity * o.flavor.price).reduce((a, b) => a + b);
  }

  void addItem(Pastel pastel) {

  }
}
