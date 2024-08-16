import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum SignUpStatus { success, failure }

class SignUpResult {
  final SignUpStatus status;
  final String message;

  SignUpResult({required this.status, required this.message});
}

enum SignInStatus { success, failure }

class SignInResult {
  final SignInStatus status;
  final String message;

  SignInResult({required this.status, required this.message});
}

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<SignUpResult> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("users").doc(credential.user?.uid).set({
        'name': name,
        'email': email,
        'uid': credential.user?.uid,
      });

      return SignUpResult(
        status: SignUpStatus.success,
        message: "Account created successfully",
      );
    } catch (e) {
      log(e.toString());
      return SignUpResult(
        status: SignUpStatus.failure,
        message: e.toString(),
      );
    }
  }

  Future<SignInResult> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in the user
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if user is not null
      if (credential.user != null) {
        return SignInResult(
          status: SignInStatus.success,
          message: 'Successfully signed in',
        );
      } else {
        return SignInResult(
          status: SignInStatus.failure,
          message: 'Sign in failed',
        );
      }
    } catch (e) {
      log(e.toString());
      return SignInResult(
        status: SignInStatus.failure,
        message: 'An error occurred during sign in',
      );
    }
  }
}
