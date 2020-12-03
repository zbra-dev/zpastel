import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'StorableEntity.dart';

part 'Flavor.g.dart';

@JsonSerializable(explicitToJson: true)
class Flavor implements StorableEntity {
  @override
  int id;

  String name;
  String ingredients; // todo: abstract this in a better way.
  double price; // todo: improve this
  String flavorImageUrl;

  String get valueInReal => new NumberFormat("R\$ #,##0.00", "pt_BR").format(price);

  @override
  int createdById;
  @override
  DateTime createdOn;
  @override
  int lastModifiedById;
  @override
  DateTime lastModifiedOn;

  Flavor();

  factory Flavor.fromJson(Map<String, dynamic> json) => _$FlavorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FlavorToJson(this);
}
