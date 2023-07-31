part of 'winners_bloc.dart';

abstract class WinnersEvent extends Equatable {
  const WinnersEvent();

  @override
  List<Object> get props => [];
}

class FetchWinnersEvent extends WinnersEvent {}
