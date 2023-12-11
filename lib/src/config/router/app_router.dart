import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/news/bloc/news_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/database_repository.dart';
import '../../domain/models/event_model.dart';
import '../../domain/models/news_model.dart';
import '../../domain/models/user_model.dart';
import '../../presentation/blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../../presentation/blocs/auth_bloc/auth_bloc.dart';
import '../../presentation/blocs/date_picker_cubit/date_picker_cubit.dart';
import '../../presentation/blocs/gallery_upload_bloc/gallery_upload_bloc.dart';
import '../../presentation/blocs/my_slider/my_slider_bloc.dart';
import '../../presentation/blocs/random_winner_bloc/random_winner_bloc.dart';
import '../../presentation/blocs/upcoming_events/upcoming_events_bloc.dart';
import '../../presentation/blocs/update_account_bloc/update_account_bloc.dart';
import '../../presentation/view/all_past_events/bloc/all_past_events_bloc.dart';
import '../../presentation/view/all_past_events/pages/all_past_events.dart';
import '../../presentation/view/all_past_events/widgets/past_event_full_view.dart';
import '../../presentation/view/authentication/auth_flow.dart';
import '../../presentation/view/extras_view/bloc/extras_bloc.dart';
import '../../presentation/view/extras_view/pages/extras_view.dart';
import '../../presentation/view/fit_committee/bloc/fit_committee_bloc.dart';
import '../../presentation/view/fit_committee/pages/fit_committee_view.dart';
import '../../presentation/view/fit_ui_navigator.dart';
import '../../presentation/view/gallery/bloc/gallery_bloc.dart';
import '../../presentation/view/gallery/pages/gallery_view.dart';
import '../../presentation/view/gallery/widgets/gallery_upload.dart';
import '../../presentation/view/home/widgets/event_registration_view.dart';
import '../../presentation/view/honour_board/bloc/honour_board_bloc.dart';
import '../../presentation/view/honour_board/pages/honours_board_view.dart';
import '../../presentation/view/news/pages/news_view.dart';
import '../../presentation/view/news/widgets/news_full_view.dart';
import '../../presentation/view/notifications/notifications_view.dart';
import '../../presentation/view/update_account/update_account_view.dart';
import '../../presentation/view/winners/bloc/winners_bloc/winners_bloc.dart';
import '../../presentation/view/winners/pages/winners_view.dart';
import 'app_router_constants.dart';

// final _authrepository = AuthRepository();
final _databaseRepository = DatabaseRepository();
final _emailAuthBloc = AuthBloc();
final _updateAccountBloc =
    UpdateAccountBloc(dataRepository: _databaseRepository);
final _appNavigatorCubit = AppNavigatorCubit();
// final _winnersBloc = WinnersBloc(databaseRepository: _databaseRepository);
final _fitCommitteeBloc = FitCommitteeBloc(_databaseRepository);
final _upcomingEventsBloc =
    UpcomingEventsBloc(databaseRepository: _databaseRepository);
final _upcomingEventsSliderBloc = MySliderBloc();
final _allEvetsImagesSliderBloc = MySliderBloc();
final _newsImagesSliderBloc = MySliderBloc();
final _randomWinnerBloc =
    RandomWinnerBloc(databaseRepository: _databaseRepository);
final _honourBoardBloc = HonourBoardBloc(_databaseRepository);
final _allPastEventsBloc = AllPastEventsBloc(_databaseRepository);
final _newsBloc = NewsBloc(_databaseRepository);
final _galleryBloc = GalleryBloc(_databaseRepository);
final _extrasBloc = ExtrasBloc(_databaseRepository);
final _admissionYrCubit = DatePickerCubit();

////////////////////////////////

final _winnersNewBloc = WinnersBloc(_databaseRepository);
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
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _updateAccountBloc,
              ),
              BlocProvider.value(
                value: _admissionYrCubit,
              ),
            ],
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
                value: _honourBoardBloc..add(const LoadHonourBoard()),
              ),
              BlocProvider.value(
                value: _honourBoardBloc,
                child: const HonoursBoardView(),
              ),
              BlocProvider.value(
                value: _newsBloc..add(const LoadNews()),
              ),
              BlocProvider.value(
                value: _galleryBloc..add(const LoadGallery()),
              ),
              BlocProvider.value(
                value: DatePickerCubit(),
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
            value: _fitCommitteeBloc..add(const LoadFitCommittee()),
            child: const FitCommitteeView(),
          ),
        ),
      ),
      GoRoute(
        name: AppRoutConstants.winnersView.name,
        path: AppRoutConstants.winnersView.path,
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider.value(
            value: _winnersNewBloc..add(const LoadWinners()),
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
            value: _allPastEventsBloc..add(const LoadAllPastEvents()),
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
                value: _allPastEventsBloc..add(const LoadAllPastEvents()),
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
            return MaterialPage(
                child: BlocProvider.value(
              value: _galleryBloc,
              child: const GalleryView(),
            ));
          }),
      GoRoute(
          name: AppRoutConstants.newsView.name,
          path: AppRoutConstants.newsView.path,
          pageBuilder: (context, state) {
            return MaterialPage(
                child: BlocProvider.value(
              value: _newsBloc,
              child: const NewsView(),
            ));
          }),
      GoRoute(
          name: AppRoutConstants.newsFullView.name,
          path: AppRoutConstants.newsFullView.path,
          pageBuilder: (context, state) {
            return MaterialPage(
                child: MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: _newsBloc,
                ),
                BlocProvider.value(
                  value: _newsImagesSliderBloc
                    ..add(const MySliderOnChangedEvent(value: 0)),
                ),
              ],
              child: NewsFullView(newsModel: state.extra as NewsModel),
            ));
          }),
      GoRoute(
          name: AppRoutConstants.galleryUploadView.name,
          path: AppRoutConstants.galleryUploadView.path,
          pageBuilder: (context, state) {
            return MaterialPage(
                child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => GalleryUploadBloc(),
                ),
                BlocProvider.value(
                  value: DatePickerCubit(),
                ),
                BlocProvider.value(
                  value: _galleryBloc,
                ),
              ],
              child: const GalleryUploadView(),
            ));
          }),
      GoRoute(
          name: AppRoutConstants.aboutView.name,
          path: AppRoutConstants.aboutView.path,
          pageBuilder: (context, state) {
            return MaterialPage(
                child: BlocProvider.value(
              value: _extrasBloc..add(const LoadExtras()),
              child: const ExtrasView(),
            ));
          }),
    ],
  );
}
