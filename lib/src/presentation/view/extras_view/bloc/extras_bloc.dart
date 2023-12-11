import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/repositories/database_repository.dart';
import '../../../../domain/models/extras_model.dart';

part 'extras_event.dart';
part 'extras_state.dart';
part 'extras_bloc.freezed.dart';

class ExtrasBloc extends Bloc<ExtrasEvent, ExtrasState> {
  final DatabaseRepository databaseRepository;

  ExtrasBloc(this.databaseRepository) : super(const ExtrasState()) {
    on<ExtrasEvent>((events, emit) async {
      await events.map(
        load: (_) async => await _load(emit),
      );
    });
  }

  _load(Emitter<ExtrasState> emit) async {
    try {
      if (state.extrasModel == null) {
        emit(state.copyWith(status: ExtrasStatus.loading));
        final extras = await databaseRepository.getExtras();
        emit(state.copyWith(status: ExtrasStatus.loaded, extrasModel: extras!));
      }
    } catch (e) {
      emit(state.copyWith(status: ExtrasStatus.error));
    }
  }
}
