import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (email == "test" && password == "123") {
        return null; // Return null if authentication is successful
      }
      return "error";
    } catch (e) {
      return e.toString(); // Return an error message if authentication fails
    }
  }
}
