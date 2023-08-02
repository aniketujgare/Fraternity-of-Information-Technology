part of 'upcoming_events_bloc.dart';

abstract class UpcomingEventsEvent extends Equatable {
  const UpcomingEventsEvent();

  @override
  List<Object> get props => [];
}

class FetchUpcomingEventsEvent extends UpcomingEventsEvent {}
