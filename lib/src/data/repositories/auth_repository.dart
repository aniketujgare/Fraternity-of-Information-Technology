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
  // Future<bool> checkSession() async {
  //   try {
  //     await account.get();
  //     // already logged it
  //     return true;
  //   } on AppwriteException catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // Future<User> getUser() async {
  //   final user = await account.get();
  //   return user;
  // }

  // Future<User?> signUp(
  //     {String? name, required String email, required String password}) async {
  //   try {
  //     var result = await account.create(
  //       userId: ID.unique(),
  //       email: email,
  //       password: password,
  //     );

  //     if (result.status == true) {
  //       var user = UserModel(
  //         email: email,
  //         userId: result.$id,
  //         age: 20,
  //         gender: 'Gender',
  //         height: 165,
  //         name: 'User',
  //         phone: 9990000999,
  //         profilePic:
  //             'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1331&q=80',
  //         weight: 65,
  //       );
  //       var userId = DatabaseRepository().createDocumnet(user);
  //       ReportRepository().createNewReport(userId);
  //       return login(email: email, password: password);
  //     }
  //   } catch (error) {
  //     print(error.toString());
  //   }
  //   return null;
  // }

  // Future<User> login({required String email, required String password}) async {
  //   await account.createEmailSession(
  //     email: email,
  //     password: password,
  //   );
  //   return await account.get();
  // }
  // // Future<models.User> resetPassword(
  // //     {required String email, required String password}) async {
  // //       await account.createRecovery(email: email, url: url)
  // //   await account.createEmailSession(
  // //     email: email,
  // //     password: password,
  // //   );
  // //   return account.get();
  // // }

  // Future<void> logout() async {
  //   try {
  //     await account.deleteSessions();
  //     print('logout: success');
  //     Restart.restartApp(webOrigin: '/');
  //   } on AppwriteException catch (e) {
  //     print('logout: ${e.message!}');
  //   }
  // }

  // resetPasswoord() async {
  //   Future result = account.createRecovery(
  //     email: 'aniketujgare@gmail.com',
  //     url: 'https://cloud.appwrite.io',
  //   );

  //   result.then((response) {
  //     print(response);
  //   }).catchError((error) {
  //     print(error.response);
  //   });
  // }
}
