part of 'upcoming_event_admin_bloc.dart';

abstract class UpcomingEventAdminEvent extends Equatable {
  const UpcomingEventAdminEvent();

  @override
  List<Object> get props => [];
}

class UpcomingEventAdminSubmit extends UpcomingEventAdminEvent {}

class UpcomingEventAdminPickImage extends UpcomingEventAdminEvent {}

class UpcomingEventAdminPickDate extends UpcomingEventAdminEvent {}
