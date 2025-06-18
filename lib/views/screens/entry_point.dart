import 'package:flutter/material.dart';
import 'package:food_world/views/screens/onboard/welcome_onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'onboard/onboard_screen.dart'; // your login screen
import 'home_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late Future<Widget> _navigationTarget;

  Future<Widget> _decideStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    final user = FirebaseAuth.instance.currentUser;

    if (!hasSeenOnboarding) {
      return const WelcomeOnboard(); // true onboarding screen
    } else if (user == null) {
      return const OnboardScreen(); // login screen
    } else {
      return const HomeScreen(); // logged in
    }
  }

  @override
  void initState() {
    super.initState();
    _navigationTarget = _decideStartScreen();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _navigationTarget,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          return snapshot.data!;
        } else {
          return const Scaffold(
            body: Center(child: Text('Something went wrong.')),
          );
        }
      },
    );
  }
}
