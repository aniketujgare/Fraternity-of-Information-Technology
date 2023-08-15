import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/news/widgets/news_full_view.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/database_repository.dart';
import '../../domain/models/event_model.dart';
import '../../domain/models/user_model.dart';
import '../../presentation/blocs/all_past_events_bloc/all_past_events_bloc.dart';
import '../../presentation/blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/blocs/fit_committee_bloc/fit_committee_bloc.dart';
import '../../presentation/blocs/honour_board_bloc/honour_board_bloc.dart';
import '../../presentation/blocs/my_slider/my_slider_bloc.dart';
import '../../presentation/blocs/random_winner_bloc/random_winner_bloc.dart';
import '../../presentation/blocs/upcoming_events/upcoming_events_bloc.dart';
import '../../presentation/blocs/update_account_bloc/update_account_bloc.dart';
import '../../presentation/blocs/winners_bloc/winners_bloc.dart';
import '../../presentation/view/all_past_events/all_past_events.dart';
import '../../presentation/view/all_past_events/widgets/past_event_full_view.dart';
import '../../presentation/view/authentication/auth_flow.dart';
import '../../presentation/view/fit_committee/fit_committee_view.dart';
import '../../presentation/view/fit_ui_navigator.dart';
import '../../presentation/view/gallery/gallery_view.dart';
import '../../presentation/view/home/widgets/event_registration_view.dart';
import '../../presentation/view/honours_board_view.dart';
import '../../presentation/view/notifications/notifications_view.dart';
import '../../presentation/view/update_account/update_account_view.dart';
import '../../presentation/view/winners/winners_view.dart';
import 'app_router_constants.dart';

// final _authrepository = AuthRepository();
final _databaseRepository = DatabaseRepository();
final _emailAuthBloc = AuthBloc();
final _updateAccountBloc =
    UpdateAccountBloc(dataRepository: _databaseRepository);
final _appNavigatorCubit = AppNavigatorCubit();
final _winnersBloc = WinnersBloc(databaseRepository: _databaseRepository);
final _fitCommitteeBloc =
    FitCommitteeBloc(databaseRepository: _databaseRepository);
final _upcomingEventsBloc =
    UpcomingEventsBloc(databaseRepository: _databaseRepository);
final _upcomingEventsSliderBloc = MySliderBloc();
final _allEvetsImagesSliderBloc = MySliderBloc();
final _randomWinnerBloc =
    RandomWinnerBloc(databaseRepository: _databaseRepository);
final _honourBoardBloc =
    HonourBoardBloc(databaseRepository: _databaseRepository);
final _allPastEventsBloc =
    AllPastEventsBloc(databaseRepository: _databaseRepository);
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
          child: BlocProvider.value(
            value: _emailAuthBloc..add(EmailAuthenticationCheckEvent()),
            child: const AuthFlow(),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutConstants.updateAccount.name,
        path: AppRoutConstants.updateAccount.path,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider.value(
            value: _updateAccountBloc,
            child: UpdateAccountView(userModel: state.extra as UserModel),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutConstants.notificationView.name,
        path: AppRoutConstants.notificationView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: NotificationView(
            message: state.queryParameters['message'],
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
                value: _emailAuthBloc,
              ),
              BlocProvider.value(
                value: _updateAccountBloc..add(const FetchUserEvent()),
              ),
              BlocProvider.value(
                value: _appNavigatorCubit,
              ),
              BlocProvider.value(
                value: _upcomingEventsBloc..add(FetchUpcomingEventsEvent()),
              ),
              BlocProvider.value(
                value: _upcomingEventsSliderBloc,
              ),
              BlocProvider.value(
                value: _randomWinnerBloc..add(FetchRandomWinnerEvent()),
              ),
              BlocProvider.value(
                value: _honourBoardBloc..add(LoadHonourBoardEvent()),
              ),
              BlocProvider.value(
                value: _honourBoardBloc,
                child: const HonoursBoardView(),
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
          child: BlocProvider.value(
            value: _fitCommitteeBloc..add(FetchFitCommitteeEvent()),
            child: const FitCommitteeView(),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutConstants.winnersView.name,
        path: AppRoutConstants.winnersView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider.value(
            value: _winnersBloc..add(FetchWinnersEvent()),
            child: const WinnersView(),
          ),
        ),
      ),
      GoRoute(
          name: AppRoutConstants.eventRegistrationView.name,
          path: AppRoutConstants.eventRegistrationView.path,
          pageBuilder: (context, state) {
            return MaterialPage(
                child: EventRegistrationView(event: state.extra as EventModel));
          }),
      GoRoute(
        name: AppRoutConstants.honourBoardView.name,
        path: AppRoutConstants.honourBoardView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider.value(
            value: _honourBoardBloc,
            child: const HonoursBoardView(),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutConstants.allPastEventsView.name,
        path: AppRoutConstants.allPastEventsView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider.value(
            value: _allPastEventsBloc..add(FetchAllPastEvents()),
            child: const AllPastEventsView(),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutConstants.pastEventFullView.name,
        path: AppRoutConstants.pastEventFullView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _allPastEventsBloc..add(FetchAllPastEvents()),
              ),
              BlocProvider.value(
                value: _allEvetsImagesSliderBloc
                  ..add(const MySliderOnChangedEvent(value: 0)),
              ),
            ],
            child: PastEventFullView(allEventModel: state.extra as EventModel),
          ),
        ),
      ),
      GoRoute(
          name: AppRoutConstants.galleryView.name,
          path: AppRoutConstants.galleryView.path,
          pageBuilder: (context, state) {
            return const MaterialPage(child: GalleryView());
          }),
      GoRoute(
          name: AppRoutConstants.newsFullView.name,
          path: AppRoutConstants.newsFullView.path,
          pageBuilder: (context, state) {
            return const MaterialPage(child: NewsFullView());
          }),
      // GoRoute(
      //     name: AppRoutConstants.adminPanel.name,
      //     path: AppRoutConstants.adminPanel.path,
      //     pageBuilder: (context, state) {
      //       return const MaterialPage(child: AdminPanel());
      //     }),
      // GoRoute(
      //   name: AppRoutConstants.upcomingEventsPanel.name,
      //   path: AppRoutConstants.upcomingEventsPanel.path,
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //       child: MultiBlocProvider(
      //         providers: [
      //           BlocProvider(
      //             create: (context) => UpcomingEventAdminBloc(),
      //           ),
      //           BlocProvider(
      //             create: (context) =>
      //                 ImagePickerBloc(databaseRepository: _databaseRepository),
      //           ),
      //           BlocProvider(
      //             create: (context) => DatePickerCubit(),
      //           ),
      //           BlocProvider.value(
      //             value: _upcomingEventsBloc,
      //           ),
      //         ],
      //         child: const UpcomingEventsAddPanel(),
      //       ),
      //     );
      //   },
      // ),
      // GoRoute(
      //     name: AppRoutConstants.upcomingEventsList.name,
      //     path: AppRoutConstants.upcomingEventsList.path,
      //     pageBuilder: (context, state) {
      //       return MaterialPage(
      //           child: MultiBlocProvider(
      //         providers: [
      //           BlocProvider.value(
      //             value: _upcomingEventsBloc..add(FetchUpcomingEventsEvent()),
      //           ),
      //         ],
      //         child: const UpcomingEventsList(),
      //       ));
      //     }),
      // GoRoute(
      //     name: AppRoutConstants.upcomingEventUpdate.name,
      //     path: AppRoutConstants.upcomingEventUpdate.path,
      //     pageBuilder: (context, state) {
      //       return MaterialPage(
      //           child: MultiBlocProvider(
      //         providers: [
      //           BlocProvider(
      //             create: (context) =>
      //                 ImagePickerBloc(databaseRepository: _databaseRepository),
      //           ),
      //           BlocProvider(
      //             create: (context) => DatePickerCubit(),
      //           ),
      //           BlocProvider(
      //             create: (context) => UpcomingEventAdminBloc(),
      //           ),
      //         ],
      //         child: UpcomingEventsAddUpdatePanel(
      //             eventModel: state.extra as UpcomingEventModel),
      //       ));
      //     }),
      // GoRoute(
      //     name: AppRoutConstants.winnersAdmin.name,
      //     path: AppRoutConstants.winnersAdmin.path,
      //     pageBuilder: (context, state) {
      //       return MaterialPage(
      //           child: MultiBlocProvider(
      //         providers: [
      //           BlocProvider(
      //             create: (context) =>
      //                 ImagePickerBloc(databaseRepository: _databaseRepository),
      //           ),
      //           BlocProvider(
      //             create: (context) => DatePickerCubit(),
      //           ),
      //           BlocProvider(
      //             create: (context) => UpcomingEventAdminBloc(),
      //           ),
      //           BlocProvider(
      //             create: (context) => DropdownCubit(),
      //           ),
      //           BlocProvider(
      //             create: (context) => WinnersAdminBloc(),
      //           ),
      //         ],
      //         child: WinnersAdmin(eventModel: UpcomingEventModel()),
      //       ));
      //     }),
    ],
  );
}
