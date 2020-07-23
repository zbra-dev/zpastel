
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zpastel/model/StorableEntity.dart';

typedef S ItemCreator<S>();

abstract class StorableEntityConverter<T extends StorableEntity> {
  ItemCreator<T> creator;

  StorableEntityConverter({this.creator});

  T convert(DocumentSnapshot document) {
    T entity = creator();

    if (document.exists && document.data.isNotEmpty) {
      var data = document.data;

      entity.id = document.documentID;
      entity.createdById = data['createdById'];
      entity.lastModifiedById = data['lastModifiedById'];
      entity.createdOn = data['createdOn'] != null ? DateTime.parse(data['createdOn'] as String) : DateTime.now();
      entity.lastModifiedOn = data['lastModifiedOn'] != null ? DateTime.parse(data['lastModifiedOn'] as String) : DateTime.now();

      convertSpecificFields(entity, data);
    }
    return entity;
  }

  void convertSpecificFields(T entity, Map<String, dynamic> data);
}
