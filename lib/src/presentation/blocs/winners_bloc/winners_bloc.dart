import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/event_winners_model.dart';

part 'winners_event.dart';
part 'winners_state.dart';

class WinnersBloc extends Bloc<WinnersEvent, WinnersState> {
  final DatabaseRepository databaseRepository;
  WinnersBloc({required this.databaseRepository})
      : super(WinnersLoadingState()) {
    on<FetchWinnersEvent>((event, emit) async {
      try {
        final List<EventWinnersModel> winnersList =
            await databaseRepository.getAllWinners();
        emit(WinnersLoadedState(winners: winnersList));
      } catch (e) {
        emit(const WinnersErrorState(errorMessage: 'Failed to fetch winners'));
      }
    });
  }
}
