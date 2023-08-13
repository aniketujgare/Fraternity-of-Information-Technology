class _AppRoutModel {
  final String name;
  final String path;

  _AppRoutModel({required this.name, required this.path});
}

class AppRoutConstants {
  static final authFlow = _AppRoutModel(name: 'authFlow', path: '/a');
  static final home = _AppRoutModel(name: 'home', path: '/home');
  static final updateAccount =
      _AppRoutModel(name: 'updateAccount', path: '/updateAccount');
  static final notificationView =
      _AppRoutModel(name: 'notificationView', path: '/notificationView');
  static final fitUiNavigator =
      _AppRoutModel(name: 'FITUINavigator', path: '/FITUINavigator');
  static final fitCommittee =
      _AppRoutModel(name: 'fitCommittee', path: '/fitCommittee');
  static final winnersView =
      _AppRoutModel(name: 'winnersView', path: '/winnersView');
  static final eventRegistrationView = _AppRoutModel(
      name: 'eventRegistrationView', path: '/eventRegistrationView');
  static final authView = _AppRoutModel(name: 'authView', path: '/authView');
  static final honourBoardView =
      _AppRoutModel(name: 'honourBoardView', path: '/honourBoardView');
  static final allPastEventsView =
      _AppRoutModel(name: 'allPastEventsView', path: '/allPastEventsView');
  static final pastEventFullView =
      _AppRoutModel(name: 'pastEventFullView', path: '/pastEventFullView');
  static final galleryView =
      _AppRoutModel(name: 'galleryView', path: '/galleryView');
  static final newsView = _AppRoutModel(name: 'newsView', path: '/newsView');
  static final adminPanel = _AppRoutModel(name: 'adminPanel', path: '/');
  static final upcomingEventsPanel =
      _AppRoutModel(name: 'upcomingEventsPanel', path: '/upcomingEventsPanel');
  static final upcomingEventsList =
      _AppRoutModel(name: 'upcomingEventsList', path: '/upcomingEventsList');
  static final upcomingEventUpdate =
      _AppRoutModel(name: 'upcomingEventUpdate', path: '/upcomingEventUpdate');
}
