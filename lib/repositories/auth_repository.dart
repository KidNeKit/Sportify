import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/models/user.dart';

class AuthRepository {
  final auth.FirebaseAuth _authRepository;

  AuthRepository({auth.FirebaseAuth? authRepository})
      : _authRepository = authRepository ?? auth.FirebaseAuth.instance;

  Stream<auth.User?> get user => _authRepository.userChanges();

  Future<auth.User?> signIn(
      {required String email, required String password}) async {
    try {
      final credential = await _authRepository.signInWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      return user;
    } catch (e) {
      log('Error due user authorization: $e');
      rethrow;
    }
  }

  Future<auth.User?> signUp(
      {required User newUser, required String password}) async {
    try {
      final credential = await _authRepository.createUserWithEmailAndPassword(
          email: newUser.email, password: password);
      final user = credential.user;

      User myUser = User(
          id: user!.uid,
          email: user.email!,
          username: newUser.username,
          height: newUser.height,
          weight: newUser.weight);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(myUser.toMap());

      return user;
    } catch (e) {
      log('Error due user registration: $e');
      return null;
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([_authRepository.signOut()]);
    } catch (e) {
      log('Error due log out: $e');
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      String uid = _authRepository.currentUser!.uid;
      final snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return User.fromMap(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      log('Error during getting user info: $e');
    }
    return null;
  }
}
