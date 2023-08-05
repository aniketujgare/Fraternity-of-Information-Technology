import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/event_winners_model.dart';

part 'random_winner_event.dart';
part 'random_winner_state.dart';

List<EventWinnersModel> listEventWinners = [];

class RandomWinnerBloc extends Bloc<RandomWinnerEvent, RandomWinnerState> {
  final DatabaseRepository databaseRepository;
  RandomWinnerBloc({required this.databaseRepository})
      : super(RandomWinnerInitial()) {
    on<FetchRandomWinnerEvent>((event, emit) async {
      try {
        if (listEventWinners.isEmpty) {
          final winner = await databaseRepository.getARandomWinner();
          listEventWinners.add(winner);
        }
        emit(RandomWinnersLoadedState(winners: listEventWinners.first));
      } catch (e) {
        emit(const RandomWinnerErrorState(
            errorMessage: 'Failed to fetch winners'));
      }
    });
  }
}
