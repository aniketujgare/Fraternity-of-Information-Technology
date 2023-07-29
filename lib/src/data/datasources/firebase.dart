// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseAuthentication {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   loginWithPhone() async {
//     await auth.verifyPhoneNumber(
//       phoneNumber: '+919175197037',
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {},
//       codeSent: (String verificationId, int? resendToken) {
//         context.read<AuthBloc>().add(
//             SendOTP(verificationId: verificationId, resendToken: resendToken));
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
// }
