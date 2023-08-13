part of 'upcoming_event_admin_bloc.dart';

abstract class UpcomingEventAdminState extends Equatable {
  const UpcomingEventAdminState();

  @override
  List<Object> get props => [];
}

class UpcomingEventAdminInitial extends UpcomingEventAdminState {}

class UpcomingEventAdminSuccess extends UpcomingEventAdminState {}

class UpcomingEventAdminImagePicked extends UpcomingEventAdminState {
  final String imagePath;
  const UpcomingEventAdminImagePicked(this.imagePath);
  @override
  List<Object> get props => [imagePath];
}
