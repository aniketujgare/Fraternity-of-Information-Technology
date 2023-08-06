part of 'honour_board_bloc.dart';

abstract class HonourBoardState extends Equatable {
  const HonourBoardState();

  @override
  List<Object> get props => [];
}

class HonourBoardLoading extends HonourBoardState {}

class HonourBoardLoaded extends HonourBoardState {
  final List<HonourBoardModel> honourBoard;
  const HonourBoardLoaded({required this.honourBoard});
  @override
  List<Object> get props => [honourBoard];
}

class HonourBoardError extends HonourBoardState {
  final String error;
  const HonourBoardError({required this.error});
  @override
  List<Object> get props => [error];
}
