part of 'auth_bloc.dart';

enum AuthFormType { signIn, signUp }

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthToggleFormEvent extends AuthEvent {
  final AuthFormType formType;

  const AuthToggleFormEvent({required this.formType});
  @override
  List<Object> get props => [formType];
}

class EmailSignUpEvent extends AuthEvent {
  final String userEmail;
  final String password;
  const EmailSignUpEvent({required this.userEmail, required this.password});

  @override
  List<Object> get props => [userEmail, password];
}

class EmailVerificationEvent extends AuthEvent {
  final User user;
  final String userEmail;
  final String password;
  const EmailVerificationEvent({
    required this.user,
    required this.userEmail,
    required this.password,
  });

  @override
  List<Object> get props => [user, userEmail, password];
}

class EmailAuthCompleteEvent extends AuthEvent {}

class EmailLoginEvent extends AuthEvent {
  final String userEmail;
  final String password;
  const EmailLoginEvent({required this.userEmail, required this.password});

  @override
  List<Object> get props => [userEmail, password];
}

class UserLoggedInEvent extends AuthEvent {}

class YouRAllSetEvent extends AuthEvent {}

class EmailAuthenticationCheckEvent extends AuthEvent {}

class AuthSignOutEvent extends AuthEvent {}
