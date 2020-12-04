import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zpastel/gateway/HttpGateway.dart';
import 'package:zpastel/model/User.dart';
import 'package:zpastel/persistence/store/FirestoreStore.dart';

import 'converters/UserConverter.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestoreStore<User> _store;
  HttpGateway httpGateway;

  UserRepository() {
    this._store = new FirestoreStore.entity(new User(), UserConverter());
  }

  Future<User> signIn(String username, String password) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(email: username, password: password);
      return result != null && result.user != null ? _convertFrom(result.user) : null;
    } catch (e) {
      //TODO: thrown an error
      return null;
    }
  }


  Future<User> createUserLogin(String email, String password) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return result != null && result.user != null ? _convertFrom(result.user) : null;
    } catch (e) {
      //TODO: thrown an error
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> getUser() async {
    try {
      var user = await _firebaseAuth.currentUser();
      return _convertFrom(user);
    } catch (e) {
      return null;
    }
  }

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_convertFrom);
  }

  User _convertFrom(FirebaseUser firebaseUser) {
    if (firebaseUser != null) {
      var user = new User();
      user.firebaseId = firebaseUser.uid;
      user.email = firebaseUser.email;
      user.name = firebaseUser.displayName;
      user.photoUrl = firebaseUser.photoUrl;
      return user;
    }
    return null;
  }

  signInWithGoogle() async {
    try {
      final signIn = new GoogleSignIn();
      var account = await signIn.signIn();
      var auth = await account.authentication;
      var result = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.getCredential(idToken: auth.idToken, accessToken: auth.accessToken));
      return _convertFrom(result.user);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> save(user) async {
    //await httpGateway.post('', );
  }

  Future<User> findBy(String firebaseId) async {
    final response = await httpGateway.get('http://10.0.2.2:49985/api/users/$firebaseId');

    return User.fromJson(jsonDecode(response.body));
  }
}
