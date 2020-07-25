import 'package:json_annotation/json_annotation.dart';

import 'StorableEntity.dart';

part 'Flavor.g.dart';

@JsonSerializable(explicitToJson: true)
class Flavor implements StorableEntity {
  @override
  String id;

  String name;
  String ingredients; // todo: abstract this in a better way.
  double value; // todo: improve this
  String flavorImageUrl;

  String get valueInReal => "R\$ $value";

  @override
  String createdById;
  @override
  DateTime createdOn;
  @override
  String lastModifiedById;
  @override
  DateTime lastModifiedOn;

  Flavor();

  factory Flavor.fromJson(Map<String, dynamic> json) => _$FlavorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FlavorToJson(this);
}
