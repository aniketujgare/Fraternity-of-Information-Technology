import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:fraternity_of_information_technology/src/domain/models/honour_board_model.dart';

part 'honour_board_event.dart';
part 'honour_board_state.dart';

class HonourBoardBloc extends Bloc<HonourBoardEvent, HonourBoardState> {
  final DatabaseRepository databaseRepository;
  List<HonourBoardModel>? honourBoard;
  HonourBoardBloc({required this.databaseRepository})
      : super(HonourBoardLoading()) {
    on<HonourBoardEvent>((event, emit) async {
      try {
        debugPrint('runned honor board fetch');
        honourBoard ??= await databaseRepository.getHonourBoard();
        if (honourBoard != null) {
          emit(HonourBoardLoaded(honourBoard: honourBoard!));
        }
      } catch (e) {
        emit(HonourBoardError(error: e.toString()));
      }
    });
  }
}
