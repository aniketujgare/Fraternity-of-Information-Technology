import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/bloc/auth_bloc/auth_bloc.dart';
import 'package:fraternity_of_information_technology/bloc/update_account_bloc/update_account_bloc.dart';
import 'package:fraternity_of_information_technology/screens/authentication/authentication_view.dart';
import 'package:fraternity_of_information_technology/screens/home/home_view.dart';
import 'package:fraternity_of_information_technology/screens/update_account/update_account_view.dart';

class AppRouter {
  final _authBloc = AuthBloc();
  final _updateAccountBloc = UpdateAccountBloc();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/ho':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authBloc,
            child: const AuthenticationView(),
          ),
        );
      case '/updateAccount':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _authBloc,
              ),
              BlocProvider.value(
                value: _updateAccountBloc,
              ),
            ],
            child: const UpdateAccountView(),
          ),
        );
      case '/': //'/home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _authBloc,
              ),
              BlocProvider.value(
                value: _updateAccountBloc,
              ),
            ],
            child: const HomeView(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _authBloc.close();
    _updateAccountBloc.close();
  }
}
