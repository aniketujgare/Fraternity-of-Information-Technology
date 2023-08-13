part of 'email_auth_bloc.dart';

enum AuthFormType { signIn, signUp }

abstract class EmailAuthEvent extends Equatable {
  const EmailAuthEvent();

  @override
  List<Object> get props => [];
}

class AuthToggleFormEvent extends EmailAuthEvent {
  final AuthFormType formType;

  const AuthToggleFormEvent({required this.formType});
  @override
  List<Object> get props => [formType];
}

class EmailSignUpEvent extends EmailAuthEvent {
  final String userEmail;
  final String password;
  const EmailSignUpEvent({required this.userEmail, required this.password});

  @override
  List<Object> get props => [userEmail, password];
}

class EmailVerificationEvent extends EmailAuthEvent {
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

class EmailAuthCompleteEvent extends EmailAuthEvent {}

class EmailLoginEvent extends EmailAuthEvent {
  final String userEmail;
  final String password;
  const EmailLoginEvent({required this.userEmail, required this.password});

  @override
  List<Object> get props => [userEmail, password];
}

class UserLoggedInEvent extends EmailAuthEvent {}

class YouRAllSetEvent extends EmailAuthEvent {}

class EmailAuthenticationCheckEvent extends EmailAuthEvent {}

class AuthSignOutEvent extends EmailAuthEvent {}
