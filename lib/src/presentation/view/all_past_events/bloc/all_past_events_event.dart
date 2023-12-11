part of 'all_past_events_bloc.dart';

@freezed
class AllPastEventsEvent with _$AllPastEventsEvent {
  const factory AllPastEventsEvent.load() = LoadAllPastEvents;
}
