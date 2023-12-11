part of 'all_past_events_bloc.dart';

enum AllPastEventsStatus { initial, loading, loaded, error }

@freezed
class AllPastEventsState with _$AllPastEventsState {
  const factory AllPastEventsState({
    @Default(AllPastEventsStatus.initial) AllPastEventsStatus status,
    @Default([]) List<EventModel> allPastEventsList,
    @Default('Failed to load past events!') String errorMessage,
  }) = Initial;
}
