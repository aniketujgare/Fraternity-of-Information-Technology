part of 'honour_board_bloc.dart';

@freezed
class HonourBoardEvent with _$HonourBoardEvent {
  const factory HonourBoardEvent.load() = LoadHonourBoard;
}
