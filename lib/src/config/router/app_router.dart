import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/blocs/update_account_bloc/update_account_bloc.dart';
import '../../presentation/view/authentication/authentication_view.dart';
import '../../presentation/view/fit_committee/fit_committee_view.dart';
import '../../presentation/view/fit_ui_navigator.dart';
import '../../presentation/view/notifications/notifications_view.dart';
import '../../presentation/view/update_account/update_account_view.dart';
import '../../presentation/view/user_profile/user_profile_view.dart';
import '../../presentation/view/winners/winners_view.dart';
import '../../utils/constants/constants.dart';

class AppRouter {
  final _authBloc = AuthBloc();
  final _updateAccountBloc = UpdateAccountBloc();
  final _appNavigatorCubit = AppNavigatorCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ScreenName.authentication:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authBloc,
            child: const AuthenticationView(),
          ),
        );
      case ScreenName.updateAccount:
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
      case ScreenName.home:
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
            child: const UserProfileView(),
          ),
        );
      case ScreenName.notificationView: //'/home':
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
            child: const NotificationView(),
          ),
        );
      case ScreenName.fitUiNavigator: //'/home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _authBloc,
              ),
              BlocProvider.value(
                value: _updateAccountBloc,
              ),
              BlocProvider.value(
                value: _appNavigatorCubit,
              ),
            ],
            child: const FITUINavigator(),
          ),
        );
      case ScreenName.fitCommittee: //'/home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _authBloc,
              ),
              BlocProvider.value(
                value: _updateAccountBloc,
              ),
              BlocProvider.value(
                value: _appNavigatorCubit,
              ),
            ],
            child: const FitCommitteeView(),
          ),
        );
      case ScreenName.winnersVIew: //'/home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _authBloc,
              ),
              BlocProvider.value(
                value: _updateAccountBloc,
              ),
              BlocProvider.value(
                value: _appNavigatorCubit,
              ),
            ],
            child: const WinnersView(),
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
