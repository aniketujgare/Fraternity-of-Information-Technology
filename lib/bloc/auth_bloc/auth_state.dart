part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class UnAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class AuthSucessState extends AuthState {}
