import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/model/Pastel.dart';

import 'StorableEntityConverter.dart';

class PastelConverter extends StorableEntityConverter<Pastel> {
  PastelConverter() : super(creator: () => Pastel());

  @override
  void convertSpecificFields(Pastel pastel, Map<String, dynamic> data) {
    pastel.id = data['Id'];
    pastel.createdById = data['createdById'];
    pastel.createdOn = data['createdOn'];
    pastel.quantity = data['quantity'];
    pastel.ingredients = data['ingredients'];
    pastel.extraInformation = data['extraInformation'];
    pastel.lastModifiedById = data['lastModifiedById'];
    pastel.lastModifiedOn = data['lastModifiedOn'];
  }
}
