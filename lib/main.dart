import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habitly/screens/nav.dart';
import 'package:habitly/screens/logIn.dart';
import 'package:habitly/screens/onboarding_screen.dart';
import 'package:habitly/screens/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  NavScreen(),  // Start with the AuthenticationWrapper
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if a user is currently signed in
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // If a user is signed in, navigate to the home screen
      return const Material();
    } else {
      // If no user is signed in, navigate to the onboarding screen
      return const OnBoardingPage();
    }
  }
}
