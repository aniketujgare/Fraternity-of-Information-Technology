import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/database_repository.dart';
import '../../../../domain/models/user_model.dart';

part 'email_auth_event.dart';
part 'email_auth_state.dart';

class EmailAuthBloc extends Bloc<EmailAuthEvent, EmailAuthState> {
  EmailAuthBloc() : super(const EmailAuthInitialState(AuthFormType.signIn)) {
    on<EmailSignUpEvent>(_signUp);
    on<EmailVerificationEvent>(_verifyEmail);
    on<EmailLoginEvent>(_userLogin);
    on<YouRAllSetEvent>((event, emit) => emit(YouRAllSetState()));
    // When user clicks on send otp button then this event will be fired
    on<EmailAuthenticationCheckEvent>(_authCheck);
    on<AuthToggleFormEvent>(
        (event, emit) => emit(EmailAuthInitialState(event.formType)));
  }

  Future<void> _signUp(
      EmailSignUpEvent event, Emitter<EmailAuthState> emit) async {
    emit(EmailAuthLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.userEmail, password: event.password)
          .then(
        (userCredential) async {
          if (userCredential.user != null) {
            bool isCollectionExist =
                await DatabaseRepository().checkUserExists();
            if (!isCollectionExist) {
              DatabaseRepository().addUser(UserModel(
                  docID: userCredential.user!.uid, phone: '9175197037'));
            }
          }
          add(
            EmailVerificationEvent(
              user: userCredential.user!,
              userEmail: event.userEmail,
              password: event.userEmail,
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        emit(const EmailAuthError(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        emit(const EmailAuthError(
            error: 'The account already exists for that email.'));
      }
      // return null;
    } catch (e) {
      debugPrint(e.toString());
      emit(EmailAuthError(error: e.toString()));
    }
  }

  Future<void> _verifyEmail(
      EmailVerificationEvent event, Emitter<EmailAuthState> emit) async {
    emit(VerifyEmail(email: event.user.email ?? ' '));
    Timer? timer;
    event.user.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 3),
        (_) => checkEmailVerified(event.user, timer));
  }

  checkEmailVerified(User user, Timer? timer) async {
    await FirebaseAuth.instance.currentUser?.reload();
    var emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    debugPrint('emial verified $emailVerified');
    if (emailVerified) {
      timer?.cancel();
      add(YouRAllSetEvent());
      debugPrint('YouRAllSetEvent');
      await Future.delayed(const Duration(seconds: 4));
      // add(LoginBottomSheetEvent());
      add(const AuthToggleFormEvent(formType: AuthFormType.signIn));
    }
  }

  void _userLogin(EmailLoginEvent event, Emitter<EmailAuthState> emit) async {
    emit(EmailAuthLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.userEmail, password: event.password)
          .whenComplete(() => emit(UserLoggedIn()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  _authCheck(
      EmailAuthenticationCheckEvent event, Emitter<EmailAuthState> emit) async {
    emit(EmailAuthLoading());
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(UserLoggedIn());
      } else {
        // emit(LoginBottomSheetState());
        add(const AuthToggleFormEvent(formType: AuthFormType.signIn));
      }
    } catch (e) {
      emit(EmailAuthError(error: e.toString()));
    }
  }
}
