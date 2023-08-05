class _AppRoutModel {
  final String name;
  final String path;

  _AppRoutModel({required this.name, required this.path});
}

class AppRoutConstants {
  static final authFlow = _AppRoutModel(name: 'authFlow', path: '/');
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
}
