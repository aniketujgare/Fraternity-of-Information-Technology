import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/honour_board_model.dart';

part 'honour_board_event.dart';
part 'honour_board_state.dart';
part 'honour_board_bloc.freezed.dart';

class HonourBoardBloc extends Bloc<HonourBoardEvent, HonourBoardState> {
  final DatabaseRepository databaseRepository;

  HonourBoardBloc(this.databaseRepository) : super(const HonourBoardState()) {
    on<HonourBoardEvent>((events, emit) async {
      await events.map(
        load: (_) async => await _load(emit),
      );
    });
  }

  _load(Emitter<HonourBoardState> emit) async {
    try {
      if (state.honourBoard.isEmpty) {
        emit(state.copyWith(status: HonourBoardStatus.loading));
        final honourBoard = await databaseRepository.getHonourBoard();
        emit(state.copyWith(
            status: HonourBoardStatus.loaded, honourBoard: honourBoard));
      }
    } catch (e) {
      emit(state.copyWith(status: HonourBoardStatus.error));
    }
  }
}
