import 'package:zpastel/model/Flavor.dart';

import 'StorableEntityConverter.dart';

class FlavorConverter extends StorableEntityConverter<Flavor> {
  FlavorConverter() : super(creator: () => Flavor());

  @override
  void convertSpecificFields(Flavor flavor, Map<String, dynamic> data) {
    flavor.ingredients = data['ingredients'];
    flavor.name = data['name'];
    flavor.value = data['value'] ?? 0;
    flavor.flavorImageUrl = data['flavorImageUrl'];
  }
}
