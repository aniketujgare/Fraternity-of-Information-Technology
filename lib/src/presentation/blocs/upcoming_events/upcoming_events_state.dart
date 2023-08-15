part of 'upcoming_events_bloc.dart';

abstract class UpcomingEventsState extends Equatable {
  const UpcomingEventsState();

  @override
  List<Object> get props => [];
}

class UpcomingEventsLoadingState extends UpcomingEventsState {}

class UpcomingEventsLoadedState extends UpcomingEventsState {
  final List<EventModel> upcomingEvents;
  const UpcomingEventsLoadedState({required this.upcomingEvents});
  @override
  List<Object> get props => [upcomingEvents];
}

class UpcomingEventsErrorState extends UpcomingEventsState {
  final String errorMessage;

  const UpcomingEventsErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
