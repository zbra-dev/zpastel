abstract class StorableEntity {
  int id;
  int createdById;
  DateTime createdOn;
  int lastModifiedById;
  DateTime lastModifiedOn;

  StorableEntity.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
