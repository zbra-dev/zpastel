import 'package:zpastel/model/Order.dart';
import 'package:zpastel/model/Pastel.dart';

import 'PastelConverter.dart';
import 'StorableEntityConverter.dart';

class OrderConverter extends StorableEntityConverter<Order> {
  OrderConverter() : super(creator: () => Order());

  @override
  void convertSpecificFields(Order order, Map<String, dynamic> data) {
    order.id = data['id'];
    var items = data['orderItems'] as List;
    order.orderItems = items != null ? items.map((item) => PastelConverter().convert(item)).toList() : List<Pastel>();
    order.createdById = data['createdById'];
    order.createdOn = data['createdById'];
    order.lastModifiedById = data['lastModifiedById'];
    order.lastModifiedOn = data['lastModifiedOn'];
  }
}
