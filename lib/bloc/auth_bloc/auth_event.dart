part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendOTP extends AuthEvent {}

class VerifyOTP extends AuthEvent {}

class YouRAllSet extends AuthEvent {}
