import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/domain/models/upcoming_event_model.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/my_slider/my_slider_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/random_winner_bloc/random_winner_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/upcoming_events/upcoming_events_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/home/widgets/event_registration_view.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/database_repository.dart';
import '../../domain/models/user_model.dart';
import '../../presentation/blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/blocs/fit_committee_bloc/fit_committee_bloc.dart';
import '../../presentation/blocs/profile_picture_bloc/profile_picture_bloc.dart';
import '../../presentation/blocs/update_account_bloc/update_account_bloc.dart';
import '../../presentation/blocs/winners_bloc/winners_bloc.dart';
import '../../presentation/view/authentication/auth_flow.dart';
import '../../presentation/view/fit_committee/fit_committee_view.dart';
import '../../presentation/view/fit_ui_navigator.dart';
import '../../presentation/view/notifications/notifications_view.dart';
import '../../presentation/view/update_account/update_account_view.dart';
import '../../presentation/view/user_profile/user_profile_view.dart';
import '../../presentation/view/winners/winners_view.dart';
import 'app_router_constants.dart';

final _authrepository = AuthRepository();
final _databaseRepository = DatabaseRepository();
final _authBloc = AuthBloc(phoneAuthRepository: _authrepository);
final _updateAccountBloc =
    UpdateAccountBloc(dataRepository: _databaseRepository);
final _appNavigatorCubit = AppNavigatorCubit();
final _profilePicBloc = ProfilePictureBloc();
final _winnersBloc = WinnersBloc(databaseRepository: _databaseRepository);
final _fitCommitteeBloc =
    FitCommitteeBloc(databaseRepository: _databaseRepository);
final _upcomingEventsBloc =
    UpcomingEventsBloc(databaseRepository: _databaseRepository);
final _sliderBloc = MySliderBloc();
final _randomWinnerBloc =
    RandomWinnerBloc(databaseRepository: _databaseRepository);
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        name: AppRoutConstants.authFlow.name,
        path: AppRoutConstants.authFlow.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _authBloc..add(const AuthenticationCheckEvent()),
              ),
            ],
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
            child: UpdateAccountView(userModel: state.extra as UserModel),
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
                value: UpdateAccountBloc(dataRepository: _databaseRepository),
              ),
              BlocProvider.value(
                value: _upcomingEventsBloc..add(FetchUpcomingEventsEvent()),
              ),
              BlocProvider.value(
                value: _sliderBloc,
              ),
              BlocProvider.value(
                value: _randomWinnerBloc,
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
            child: NotificationView(
              message: state.queryParameters['message'],
            ),
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
                value: _updateAccountBloc..add(const FetchUserEvent()),
              ),
              BlocProvider.value(
                value: _appNavigatorCubit,
              ),
              BlocProvider(
                create: (context) => _profilePicBloc,
              ),
              BlocProvider.value(
                value: _upcomingEventsBloc..add(FetchUpcomingEventsEvent()),
              ),
              BlocProvider.value(
                value: _sliderBloc,
              ),
              BlocProvider.value(
                value: _randomWinnerBloc..add(FetchRandomWinnerEvent()),
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
              BlocProvider.value(
                value: _fitCommitteeBloc..add(FetchFitCommitteeEvent()),
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
              BlocProvider.value(
                value: _winnersBloc..add(FetchWinnersEvent()),
              ),
            ],
            child: const WinnersView(),
          ),
        ),
      ),
      GoRoute(
          name: AppRoutConstants.eventRegistrationView.name,
          path: AppRoutConstants.eventRegistrationView.path,
          pageBuilder: (context, state) {
            UpcomingEventModel event = state.extra as UpcomingEventModel;
            return MaterialPage(
              child: EventRegistrationView(event: event),
            );
          }),
    ],
  );
}
