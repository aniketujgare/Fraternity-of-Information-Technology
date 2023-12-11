part of 'winners_bloc.dart';

@freezed
class WinnersEvent with _$WinnersEvent {
  const factory WinnersEvent.load() = LoadWinners;
}
