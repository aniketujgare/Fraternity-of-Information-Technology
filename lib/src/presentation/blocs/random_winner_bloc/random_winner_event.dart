part of 'random_winner_bloc.dart';

abstract class RandomWinnerEvent extends Equatable {
  const RandomWinnerEvent();

  @override
  List<Object> get props => [];
}

class FetchRandomWinnerEvent extends RandomWinnerEvent {}
