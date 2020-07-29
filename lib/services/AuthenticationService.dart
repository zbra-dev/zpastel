import 'package:zpastel/gateway/AppContextGateway.dart';
import 'package:zpastel/model/User.dart';
import 'package:zpastel/persistence/UserRepository.dart';

class AuthenticationService {
  final UserRepository _userRepository = UserRepository();
  final AppContextGateway _appContextGateway = AppContextGateway();

  Stream<User> get user {
    return _userRepository.user;
  }

  Future<User> signIn(String username, String password) async {
    var user = await _userRepository.signIn(username, password);
    await _reconnectOrCreateUser(user);
    return user;
  }

  Future<User> createUser(String username, String password, String name) async {
    var user = await _userRepository.createUserLogin(username, password);
    if (user != null) {
      user.name = name;
    }
    await _reconnectOrCreateUser(user);
    return user;
  }

  Future<User> signInWithGoogle() async {
    var user = await _userRepository.signInWithGoogle();
    await _reconnectOrCreateUser(user);
    return user;
  }

  Future signOut() async {
    await _userRepository.signOut();
    await _appContextGateway.cleanUserId();
  }

  Future _reconnectOrCreateUser(User user) async {
    if (user != null) {
      var loadedUser = await _userRepository.findBy(user.id);
      if (loadedUser == null || loadedUser.email == null || loadedUser.createdOn == null) {
        user.createdOn = DateTime.now();
        user.lastModifiedOn = DateTime.now();
        user.createdById = user.id;
        user.lastModifiedById = user.id;
        await _userRepository.save(user);
      } else {
        //TODO: maybe update user entity
      }
      return await _appContextGateway.setUserId(user.id);
    }
  }
}
