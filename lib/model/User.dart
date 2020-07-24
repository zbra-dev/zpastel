import 'StorableEntity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User implements StorableEntity {
  @override
  String id;
  @override
  String createdById;
  @override
  DateTime createdOn;
  @override
  String lastModifiedById;
  @override
  DateTime lastModifiedOn;

  String email;
  String mlId;
  String photoUrl;
  String name;

  bool get hasName {
    return name != null && name.isNotEmpty;
  }

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
