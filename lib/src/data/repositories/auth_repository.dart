import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      // print('Error signing in with email and password: $e');
      return null;
    }
  }

  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (e) {
      // print('Error signing up with email and password: $e');
      return null;
    }
  }
}
