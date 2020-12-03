import 'package:json_annotation/json_annotation.dart';
import 'package:zpastel/model/StorableEntity.dart';

import 'Pastel.dart';

part 'Order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order implements StorableEntity {
  @override
  int id;

  List<Pastel> orderItems = [];

  String createdByUsername;

  @override
  int createdById;
  @override
  DateTime createdOn;
  @override
  int lastModifiedById;
  @override
  DateTime lastModifiedOn;

  double totalPrice;

  Order();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  void addItem(Pastel item) {
    item.orderId = id;
    orderItems.add(item);
  }
}
