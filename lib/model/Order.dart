import 'package:json_annotation/json_annotation.dart';

import 'package:zpastel/model/StorableEntity.dart';

import 'Item.dart';

part 'Order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order implements StorableEntity{

  @override
  String id;
  String userId;
  @JsonKey(ignore: true)
  List<Item> items = [];

  @override
  String createdById;
  @override
  DateTime createdOn;
  @override
  String lastModifiedById;
  @override
  DateTime lastModifiedOn;

  Order();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}