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
    pastel.qtdy = data['qtdy'];
    pastel.flavor = data['flavor'] as Flavor;
    pastel.extraInformation = data['extraInformation'];
    pastel.lastModifiedById = data['lastModifiedById'];
    pastel.lastModifiedOn = data['lastModifiedOn'];
  }
}
