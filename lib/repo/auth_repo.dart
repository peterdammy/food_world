import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  FirebaseAuth firebaseAuth;
  AuthRepository({required this.firebaseAuth});

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'This email is already in use.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address.';
      } else if (e.code == 'weak-password') {
        return 'Password must be at least 6 characters.';
      } else {
        return 'Something went wrong. Try again.';
      }
    } catch (e) {
      return 'Something went wrong. Try again.';
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Optional: log or handle different error codes
      return null;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
