part of 'all_past_events_bloc.dart';

abstract class AllPastEventsEvent extends Equatable {
  const AllPastEventsEvent();

  @override
  List<Object> get props => [];
}

class FetchAllPastEvents extends AllPastEventsEvent {}
