import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/database_repository.dart';
import '../../../../../domain/models/event_winners_model.dart';

part 'winners_event.dart';
part 'winners_state.dart';
part 'winners_bloc.freezed.dart';

class WinnersBloc extends Bloc<WinnersEvent, WinnersState> {
  final DatabaseRepository databaseRepository;
  WinnersBloc(this.databaseRepository) : super(const WinnersState()) {
    on<WinnersEvent>((events, emit) async {
      await events.map(
        load: (_) async => await _load(emit),
      );
    });
  }

  _load(Emitter<WinnersState> emit) async {
    if (state.winnersList.isEmpty) {
      try {
        emit(state.copyWith(status: WinnersStatus.loading));
        final winnersList = await databaseRepository.getAllWinners();
        emit(state.copyWith(
            winnersList: winnersList, status: WinnersStatus.loaded));
      } catch (e) {
        emit(state.copyWith(status: WinnersStatus.error));
      }
    }
  }
}
