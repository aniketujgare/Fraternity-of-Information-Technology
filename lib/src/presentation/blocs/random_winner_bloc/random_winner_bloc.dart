import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/event_winners_model.dart';

part 'random_winner_event.dart';
part 'random_winner_state.dart';

class RandomWinnerBloc extends Bloc<RandomWinnerEvent, RandomWinnerState> {
  final DatabaseRepository databaseRepository;
  EventWinnersModel? randEventWinner;
  RandomWinnerBloc({required this.databaseRepository})
      : super(RandomWinnerInitial()) {
    on<FetchRandomWinnerEvent>((event, emit) async {
      try {
        randEventWinner ??= await databaseRepository.getARandomWinner();
        if (randEventWinner != null) {
          emit(RandomWinnersLoadedState(winners: randEventWinner!));
        }
      } catch (e) {
        emit(const RandomWinnerErrorState(
            errorMessage: 'Failed to fetch winners'));
      }
    });
  }
}
