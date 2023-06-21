import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/config/router/app_router_constants.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/authentication/auth_flow.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/blocs/update_account_bloc/update_account_bloc.dart';
import '../../presentation/view/fit_committee/fit_committee_view.dart';
import '../../presentation/view/fit_ui_navigator.dart';
import '../../presentation/view/notifications/notifications_view.dart';
import '../../presentation/view/update_account/update_account_view.dart';
import '../../presentation/view/user_profile/user_profile_view.dart';
import '../../presentation/view/winners/winners_view.dart';

final _authBloc = AuthBloc();
final _updateAccountBloc = UpdateAccountBloc();
final _appNavigatorCubit = AppNavigatorCubit();

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutConstants.authFlow.name,
        path: AppRoutConstants.authFlow.path,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider.value(
            value: _authBloc,
            child: const AuthFlow(),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutConstants.updateAccount.name,
        path: AppRoutConstants.updateAccount.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
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
        ),
      ),
      GoRoute(
        name: AppRoutConstants.home.name,
        path: AppRoutConstants.home.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
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
        ),
      ),
      GoRoute(
        name: AppRoutConstants.notificationView.name,
        path: AppRoutConstants.notificationView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
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
        ),
      ),
      GoRoute(
        name: AppRoutConstants.fitUiNavigator.name,
        path: AppRoutConstants.fitUiNavigator.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
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
        ),
      ),
      GoRoute(
        name: AppRoutConstants.fitCommittee.name,
        path: AppRoutConstants.fitCommittee.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
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
        ),
      ),
      GoRoute(
        name: AppRoutConstants.winnersView.name,
        path: AppRoutConstants.winnersView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
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
        ),
      ),
    ],
  );
}
