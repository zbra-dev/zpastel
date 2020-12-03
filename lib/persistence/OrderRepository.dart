import 'dart:convert';

import 'package:zpastel/gateway/HttpGateway.dart';
import 'package:zpastel/model/Order.dart';

class OrderRepository {
  HttpGateway _httpGateway;

  OrderRepository() {
    _httpGateway = new HttpGateway();
  }

  Future<void> save(Order order) async {

    var body = jsonEncode(<String, dynamic> {
      'id': order.id,
      'totalPrice': order.totalPrice,
      'orderItems': order.orderItems?.map((e) => e?.toJson())?.toList(),
      'createdByUsername': order.createdByUsername,
      'createdById': order.createdById,
      'createdOn': order.createdOn?.toIso8601String(),
      'lastModifiedById': order.lastModifiedById,
      'lastModifiedOn': order.lastModifiedOn?.toIso8601String(),
    });

    order.lastModifiedOn = null;
    order.createdOn = null;
    order.orderItems[0].createdOn = null;
    order.orderItems[0].lastModifiedOn = null;

    await _httpGateway.post('http://10.0.2.2:49985/api/orders/create', order);
  }
}
