import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/fit_committee_model.dart';

part 'fit_committee_event.dart';
part 'fit_committee_state.dart';

class FitCommitteeBloc extends Bloc<FitCommitteeEvent, FitCommitteeState> {
  final DatabaseRepository databaseRepository;
  List<FITCommitteeModel>? fitCommitteeList;
  FitCommitteeBloc({required this.databaseRepository})
      : super(FitCommitteeLoadingState()) {
    on<FetchFitCommitteeEvent>((event, emit) async {
      try {
        fitCommitteeList ??= await databaseRepository.getFitCommittee();
        if (fitCommitteeList != null) {
          emit(FitCommitteeLoadedState(fitCommittee: fitCommitteeList ?? []));
        }
      } catch (e) {
        emit(const FitCommitteeErrorState(
            errorMessage: 'Failed to fetch winners'));
      }
    });
  }
}
