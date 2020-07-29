import 'package:zpastel/model/Order.dart';
import 'package:zpastel/model/Pastel.dart';

import 'PastelConverter.dart';
import 'StorableEntityConverter.dart';

class OrderConverter extends StorableEntityConverter<Order> {
  OrderConverter() : super(creator: () => Order());

  @override
  void convertSpecificFields(Order order, Map<String, dynamic> data) {
    order.id = data['Id'];
    var items = data['items'] as List;
    order.items = items != null ? items.map((item) => PastelConverter().convert(item)).toList() : List<Pastel>();
    order.createdById = data['createdById'];
    order.createdOn = data['createdById'];
    order.lastModifiedById = data['lastModifiedById'];
    order.lastModifiedOn = data['lastModifiedOn'];
  }
}
