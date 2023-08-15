part of 'all_past_events_bloc.dart';

abstract class AllPastEventsState extends Equatable {
  const AllPastEventsState();

  @override
  List<Object> get props => [];
}

class AllPastEventsLoading extends AllPastEventsState {}

class AllPastEventsLoadedState extends AllPastEventsState {
  final List<EventModel> allPastEventsList;
  const AllPastEventsLoadedState({required this.allPastEventsList});
  @override
  List<Object> get props => [allPastEventsList];
}

class AllPastErrorState extends AllPastEventsState {
  final String errorMessage;

  const AllPastErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
