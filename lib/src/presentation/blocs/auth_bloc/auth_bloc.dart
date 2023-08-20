import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const EmailAuthInitialState(AuthFormType.signIn)) {
    on<EmailSignUpEvent>(_signUp);
    on<EmailVerificationEvent>(_verifyEmail);
    on<EmailLoginEvent>(_userLogin);
    on<YouRAllSetEvent>((event, emit) => emit(YouRAllSetState()));
    on<EmailAuthenticationCheckEvent>(_authCheck);
    on<AuthToggleFormEvent>(
        (event, emit) => emit(EmailAuthInitialState(event.formType)));
    on<AuthSignOutEvent>(_signOut);
  }

  Future<void> _signUp(EmailSignUpEvent event, Emitter<AuthState> emit) async {
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
                  userId: userCredential.user!.uid,
                  email: event.userEmail,
                  dateOfCreation: DateTime.now().toString()));
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
    } catch (e) {
      debugPrint(e.toString());
      emit(EmailAuthError(error: e.toString()));
    }
  }

  Future<void> _verifyEmail(
      EmailVerificationEvent event, Emitter<AuthState> emit) async {
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
    }
  }

  void _userLogin(EmailLoginEvent event, Emitter<AuthState> emit) async {
    emit(EmailAuthLoading());
    try {
      if (EmailValidator.validate(event.userEmail)) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: event.userEmail, password: event.password)
            .then((userCredentail) {
          if (userCredentail.user != null) {
            emit(YouRAllSetState());
          }
        });
      } else {
        emit(const EmailAuthError(error: 'Please enter a valid email!'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        emit(const EmailAuthError(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        emit(const EmailAuthError(
            error: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(const EmailAuthError(error: 'error'));
    }
  }

  _authCheck(
      EmailAuthenticationCheckEvent event, Emitter<AuthState> emit) async {
    emit(EmailAuthLoading());
    try {
      var user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        if (user.emailVerified) {
          emit(UserLoggedIn());
        } else {
          emit(VerifyEmail(email: user.email!));
        }
      } else {
        add(const AuthToggleFormEvent(formType: AuthFormType.signIn));
      }
    } catch (e) {
      emit(EmailAuthError(error: e.toString()));
    }
  }

  Future<void> _signOut(AuthSignOutEvent event, Emitter<AuthState> emit) async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(const EmailAuthInitialState(AuthFormType.signIn));
    } on FirebaseAuthException catch (e) {
      emit(EmailAuthError(error: e.toString()));
    } catch (e) {
      emit(EmailAuthError(error: e.toString()));
    }
  }
}
