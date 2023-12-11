import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:fraternity_of_information_technology/src/domain/models/fit_committee_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fit_committee_event.dart';
part 'fit_committee_state.dart';
part 'fit_committee_bloc.freezed.dart';

class FitCommitteeBloc extends Bloc<FitCommitteeEvent, FitCommitteeState> {
  final DatabaseRepository databaseRepository;
  FitCommitteeBloc(this.databaseRepository) : super(const FitCommitteeState()) {
    on<FitCommitteeEvent>((events, emit) async {
      await events.map(
        load: (_) async => await _load(emit),
      );
    });
  }

  _load(Emitter<FitCommitteeState> emit) async {
    try {
      if (state.fitCommittee.isEmpty) {
        emit(state.copyWith(status: FitCommitteeStatus.loading));
        final fitCommittee = await databaseRepository.getFitCommittee();
        emit(state.copyWith(
            status: FitCommitteeStatus.loaded, fitCommittee: fitCommittee));
      }
    } catch (e) {
      emit(state.copyWith(status: FitCommitteeStatus.error));
    }
  }
}
