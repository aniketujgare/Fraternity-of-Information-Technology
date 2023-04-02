import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnAuthState()) {
    on<SendOTP>((event, emit) async {
      emit(LoadingAuthState());
      await Future.delayed(const Duration(seconds: 1));
      emit(SendOTPState());
    });

    on<YouRAllSet>((event, emit) async {
      emit(LoadingAuthState());
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthSucessState());
    });
  }
}
