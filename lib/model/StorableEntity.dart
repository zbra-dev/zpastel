abstract class StorableEntity {
  String id;
  String createdById;
  DateTime createdOn;
  String lastModifiedById;
  DateTime lastModifiedOn;

  StorableEntity.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
