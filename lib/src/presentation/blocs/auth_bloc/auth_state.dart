part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class PhoneAuthInitial extends AuthState {
  const PhoneAuthInitial();
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class PhoneAuthError extends AuthState {
  final String error;

  const PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class PhoneAuthVerified extends AuthState {}

class PhoneAuthCodeSentSuccess extends AuthState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  @override
  List<Object> get props => [verificationId];
}

class AuthenticationSigningOutState extends AuthState {
  const AuthenticationSigningOutState();
  @override
  List<Object> get props => [];
}
// class UnAuthState extends AuthState {}

// class LoadingAuthState extends AuthState {}

// class AuthSucessState extends AuthState {}

// class SendOTPState extends AuthState {
//   final String verificationId;
//   final int? resendToken;

//   SendOTPState({required this.verificationId, this.resendToken});
// }
