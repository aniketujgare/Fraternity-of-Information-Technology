// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// import '../../../data/repositories/auth_repository.dart';
// import '../../../data/repositories/database_repository.dart';
// import '../../../domain/models/user_model.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthRepository phoneAuthRepository;
//   final auth = FirebaseAuth.instance;
//   AuthBloc({required this.phoneAuthRepository})
//       : super(const PhoneAuthInitial()) {
//     // When user clicks on send otp button then this event will be fired
//     on<AuthenticationCheckEvent>(_authCheck);

//     // When user clicks on send otp button then this event will be fired
//     on<SendOtpToPhoneEvent>(_onSendOtp);

//     // After receiving the otp, When user clicks on verify otp button then this event will be fired
//     on<VerifySentOtpEvent>(_onVerifyOtp);

//     // When the firebase sends the code to the user's phone, this event will be fired
//     on<OnPhoneOtpSent>((event, emit) =>
//         emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));

//     // When any error occurs while sending otp to the user's phone, this event will be fired
//     on<OnPhoneAuthErrorEvent>(
//         (event, emit) => emit(PhoneAuthError(error: event.error)));

//     // When the otp verification is successful, this event will be fired
//     on<OnPhoneAuthVerificationCompleteEvent>(_loginWithCredential);

//     // When the otp verification is successful, this event will be fired
//     on<AuthenticationSignOutEvent>(_signOut);
//   }
//   Future<void> _authCheck(
//       AuthenticationCheckEvent event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     try {
//       var user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         emit(PhoneAuthVerified());
//       } else {
//         emit(const PhoneAuthInitial());
//       }
//     } catch (e) {
//       emit(PhoneAuthError(error: e.toString()));
//     }
//   }

//   Future<void> _onSendOtp(
//       SendOtpToPhoneEvent event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     try {
//       await phoneAuthRepository.verifyPhone(
//         phoneNumber: '+91${event.phoneNumber}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           // On [verificationComplete], we will get the credential from the firebase and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
//           add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
//           add(OnPhoneOtpSent(
//               verificationId: verificationId, token: resendToken));
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           // On [verificationFailed], we will get the exception from the firebase and will send it to the [OnPhoneAuthErrorEvent] event to be handled by the bloc and then will emit the [PhoneAuthError] state in order to display the error to the user's screen
//           add(OnPhoneAuthErrorEvent(error: e.code));
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//       // phoneAuthRepository.signUpWithEmailPassword(
//       //     event.phoneNumber, 'password');
//     } catch (e) {
//       emit(PhoneAuthError(error: e.toString()));
//     }
//   }

//   Future<void> _onVerifyOtp(
//       VerifySentOtpEvent event, Emitter<AuthState> emit) async {
//     try {
//       emit(AuthLoading());
//       // After receiving the otp, we will verify the otp and then will create a credential from the otp and verificationId and then will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: event.verificationId,
//         smsCode: event.otpCode,
//       );
//       add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
//     } catch (e) {
//       emit(PhoneAuthError(error: e.toString()));
//     }
//   }

//   Future<void> _loginWithCredential(OnPhoneAuthVerificationCompleteEvent event,
//       Emitter<AuthState> emit) async {
//     // After receiving the credential from the event, we will login with the credential and then will emit the [PhoneAuthVerified] state after successful login
//     try {
//       await auth.signInWithCredential(event.credential).then((user) async {
//         if (user.user != null) {
//           bool isCollectionExist = await DatabaseRepository().checkUserExists();
//           if (!isCollectionExist) {
//             DatabaseRepository().addUser(UserModel(
//                 docID: user.user!.uid, phone: user.user!.phoneNumber));
//           }
//           emit(PhoneAuthVerified());
//         }
//       });
//     } on FirebaseAuthException catch (e) {
//       emit(PhoneAuthError(error: e.code));
//     } catch (e) {
//       emit(PhoneAuthError(error: e.toString()));
//     }
//   }

//   Future<void> _signOut(
//       AuthenticationSignOutEvent event, Emitter<AuthState> emit) async {
//     // After receiving the credential from the event, we will login with the credential and then will emit the [PhoneAuthVerified] state after successful login
//     try {
//       await FirebaseAuth.instance.signOut();
//       emit(const PhoneAuthInitial());
//     } on FirebaseAuthException catch (e) {
//       emit(PhoneAuthError(error: e.code));
//     } catch (e) {
//       emit(PhoneAuthError(error: e.toString()));
//     }
//   }
// }
