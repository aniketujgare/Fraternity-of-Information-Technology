part of 'winners_bloc.dart';

enum WinnersStatus { initial, loading, loaded, error }

@freezed
class WinnersState with _$WinnersState {
  const factory WinnersState({
    @Default(WinnersStatus.initial) WinnersStatus status,
    @Default([]) List<EventWinnersModel> winnersList,
    @Default('Failed to fetch winners!') String errorMessage,
  }) = Initial;
}
