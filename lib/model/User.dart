import 'package:json_annotation/json_annotation.dart';

import 'StorableEntity.dart';

part 'User.g.dart';

@JsonSerializable()
class User implements StorableEntity {
  @override
  int id;
  @override
  int createdById;
  @override
  DateTime createdOn;
  @override
  int lastModifiedById;
  @override
  DateTime lastModifiedOn;

  String email;
  String photoUrl;
  String name;
  String firebaseId;

  bool get hasName {
    return name != null && name.isNotEmpty;
  }

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
