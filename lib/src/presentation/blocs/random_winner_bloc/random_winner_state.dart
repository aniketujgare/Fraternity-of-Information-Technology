part of 'random_winner_bloc.dart';

abstract class RandomWinnerState extends Equatable {
  const RandomWinnerState();

  @override
  List<Object> get props => [];
}

class RandomWinnerInitial extends RandomWinnerState {}

class RandomWinnerLoadingState extends RandomWinnerState {}

class RandomWinnersLoadedState extends RandomWinnerState {
  final EventWinnersModel winners;

  const RandomWinnersLoadedState({required this.winners});
  @override
  List<Object> get props => [winners];
}

class RandomWinnerErrorState extends RandomWinnerState {
  final String errorMessage;

  const RandomWinnerErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
