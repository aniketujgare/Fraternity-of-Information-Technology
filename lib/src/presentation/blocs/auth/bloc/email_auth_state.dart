part of 'email_auth_bloc.dart';

abstract class EmailAuthState extends Equatable {
  const EmailAuthState();

  @override
  List<Object> get props => [];
}

class EmailAuthInitial extends EmailAuthState {}

class EmailAuthLoading extends EmailAuthState {}

class EmailLoginState extends EmailAuthState {}

class VerifyEmail extends EmailAuthState {
  final String email;
  const VerifyEmail({required this.email});
  @override
  List<Object> get props => [email];
}

class UserLoggedIn extends EmailAuthState {}

class YouRAllSetState extends EmailAuthState {}

class LoginBottomSheetState extends EmailAuthState {}

class SignUpBottomSheetState extends EmailAuthState {}

class EmailAuthError extends EmailAuthState {
  final String error;

  const EmailAuthError({required this.error});

  @override
  List<Object> get props => [error];
}
