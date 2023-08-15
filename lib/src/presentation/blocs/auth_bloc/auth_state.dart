part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class EmailAuthInitialState extends AuthState {
  final AuthFormType formType;

  const EmailAuthInitialState(this.formType);
  @override
  List<Object> get props => [formType];
}

class EmailAuthLoading extends AuthState {}

class VerifyEmail extends AuthState {
  final String email;
  const VerifyEmail({required this.email});
  @override
  List<Object> get props => [email];
}

class UserLoggedIn extends AuthState {}

class YouRAllSetState extends AuthState {}

class EmailAuthError extends AuthState {
  final String error;

  const EmailAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class AuthSignedOutState extends AuthState {}
