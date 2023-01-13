import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as auth;

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
      {required String email, required String password}) async {
    try {
      final credential = await _authRepository.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
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
}
