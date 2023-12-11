part of 'honour_board_bloc.dart';

enum HonourBoardStatus { initial, loading, loaded, error }

@freezed
class HonourBoardState with _$HonourBoardState {
  const factory HonourBoardState({
    @Default(HonourBoardStatus.initial) HonourBoardStatus status,
    @Default([]) List<HonourBoardModel> honourBoard,
    @Default('Failed to load fit honour board!') String errorMessage,
  }) = Initial;
}
