import 'package:json_annotation/json_annotation.dart';

import 'Flavor.dart';
import 'StorableEntity.dart';
import 'Item.dart';

part 'Pastel.g.dart';

@JsonSerializable(explicitToJson: true)
class Pastel implements Item, StorableEntity {
  @override
  String id;
  @override
  String orderId;
  Flavor flavor; // this will be a copy of the flavor for history purpose

  @override
  String createdById;
  @override
  DateTime createdOn;
  @override
  String lastModifiedById;
  @override
  DateTime lastModifiedOn;

  Pastel();

  factory Pastel.fromJson(Map<String, dynamic> json) => _$PastelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PastelToJson(this);
}
