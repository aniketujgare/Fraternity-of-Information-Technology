part of 'email_auth_bloc.dart';

abstract class EmailAuthState extends Equatable {
  const EmailAuthState();

  @override
  List<Object> get props => [];
}

class EmailAuthInitialState extends EmailAuthState {
  final AuthFormType formType;

  const EmailAuthInitialState(this.formType);
  @override
  List<Object> get props => [formType];
}

class EmailAuthLoading extends EmailAuthState {}

class VerifyEmail extends EmailAuthState {
  final String email;
  const VerifyEmail({required this.email});
  @override
  List<Object> get props => [email];
}

class UserLoggedIn extends EmailAuthState {}

class YouRAllSetState extends EmailAuthState {}

class EmailAuthError extends EmailAuthState {
  final String error;

  const EmailAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class AuthSignedOutState extends EmailAuthState {}
