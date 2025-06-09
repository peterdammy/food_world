import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_world/model/personal_info_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  FirebaseAuth firebaseAuth;
  GoogleSignIn googleSignIn;

  AuthRepository({required this.firebaseAuth, required this.googleSignIn});

  // Google Sign-In
  Future<User?> signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    if (user == null) return null;

    final googleAuth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await firebaseAuth.signInWithCredential(credential);
    final firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      await _createUserDocumentIfNeeded(firebaseUser);
    }

    return firebaseUser;
  }

  // Email/Password Sign-Up
  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        await _createUserDocumentIfNeeded(firebaseUser);
      }

      return null;
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

  // Email/Password Sign-In
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = result.user;
      if (firebaseUser != null) {
        await _createUserDocumentIfNeeded(firebaseUser);
      }

      return firebaseUser;
    } on FirebaseAuthException catch (_) {
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // Create Firestore user document if it doesn’t exist
  Future<void> _createUserDocumentIfNeeded(User firebaseUser) async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid);
    final doc = await userDoc.get();

    if (!doc.exists) {
      await userDoc.set(
        PersonalInfoModel(
          email: firebaseUser.email ?? '',
          phoneNumber: '',
          location: '',
          bio: '',
          instagramUsername: '',
        ).toMap(),
      );
    }
  }

  //If you want to add/update Firestore user data
  Future<bool> addUserDataToFireStore({
    required String instagramUsername,
    required String email,
    required String phoneNumber,
    required String location,
    required String bio,
  }) async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) return false;

      final personalInfoModel = PersonalInfoModel(
        email: email,
        phoneNumber: phoneNumber,
        location: location,
        bio: bio,
        instagramUsername: instagramUsername,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(personalInfoModel.toMap(), SetOptions(merge: true));

      return true;
    } catch (e) {
      print("❌ Firestore update error: $e");
      return false;
    }
  }

  // Fetch Firestore user data
  Future<PersonalInfoModel> fetchUserDataFromFireStore() async {
    final doc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .get();

    return PersonalInfoModel.fromMap(doc.data()!);
  }
}
