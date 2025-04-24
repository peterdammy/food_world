import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/repo/auth_repo.dart';

final authServiceProvider = Provider(
  (ref) => AuthRepository(firebaseAuth: FirebaseAuth.instance),
);
