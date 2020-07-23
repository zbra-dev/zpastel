
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zpastel/gateway/AppContextGateway.dart';
import 'package:zpastel/model/StorableEntity.dart';
import 'package:zpastel/persistence/converters/StorableEntityConverter.dart';

typedef S ItemCreator<S>(Map<dynamic, dynamic> json);

class FirestoreStore<T extends StorableEntity> {
  final Firestore _store = Firestore.instance;
  final AppContextGateway _appContextGateway = AppContextGateway();
  CollectionReference _collection;

  ItemCreator<T> creator;
  StorableEntityConverter<T> _converter;

  FirestoreStore.entity(T baseEntity, StorableEntityConverter<T> converter) : this(baseEntity.runtimeType.toString(), converter);

  FirestoreStore(String collectionName, this._converter) {
    _collection = _store.collection(collectionName);
  }

  Future<void> save(T entity) async {
    entity.createdOn = entity.createdOn ?? DateTime.now();
    entity.lastModifiedOn = entity.lastModifiedOn ?? DateTime.now();
    var userId = await _appContextGateway.getUserId();
    entity.createdById = entity.createdById ?? userId;
    entity.lastModifiedById = entity.createdById ?? userId;

    _store.runTransaction((transaction) async {
      try {
        if (entity.id != null && entity.id.isNotEmpty) {
          await _collection.document(entity.id).setData(entity.toJson());
        } else {
          var doc = await _collection.reference().add(entity.toJson());
          entity.id = doc.documentID;
        }
      } catch (e) {
        // TODO: Log this
        print(e);
        throw e;
      }
    });
  }

  Future<List<T>> findEqual(String field, String value) async {
    try {
      var snapshots = await _collection.where(field, isEqualTo: value).getDocuments();
      return snapshots.documents.map((doc) => _converter.convert(doc)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<T> findBy(String id) async {
    try {
      var snapshots = await _collection.document(id).get();
      return _converter.convert(snapshots);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
