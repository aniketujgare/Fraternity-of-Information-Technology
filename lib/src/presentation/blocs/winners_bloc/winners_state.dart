part of 'winners_bloc.dart';

abstract class WinnersState extends Equatable {
  const WinnersState();

  @override
  List<Object> get props => [];
}

class WinnersLoadingState extends WinnersState {}

class WinnersLoadedState extends WinnersState {
  final List<EventWinnersModel> winners;

  const WinnersLoadedState({required this.winners});
  @override
  List<Object> get props => [winners];
}

class WinnersErrorState extends WinnersState {
  final String errorMessage;

  const WinnersErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
