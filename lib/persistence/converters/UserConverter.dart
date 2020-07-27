import 'package:zpastel/model/User.dart';

import 'StorableEntityConverter.dart';

class UserConverter extends StorableEntityConverter<User> {
  UserConverter() : super(creator: () => User());

  @override
  void convertSpecificFields(User user, Map<String, dynamic> data) {
    user.email = data['email'];
    user.photoUrl = data['photoUrl'];
    user.name = data['name'];
  }
}
