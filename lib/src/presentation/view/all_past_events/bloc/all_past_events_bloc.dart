import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/repositories/database_repository.dart';
import '../../../../domain/models/event_model.dart';
part 'all_past_events_event.dart';
part 'all_past_events_state.dart';
part 'all_past_events_bloc.freezed.dart';

class AllPastEventsBloc extends Bloc<AllPastEventsEvent, AllPastEventsState> {
  final DatabaseRepository databaseRepository;

  AllPastEventsBloc(this.databaseRepository)
      : super(const AllPastEventsState()) {
    on<AllPastEventsEvent>((events, emit) async {
      await events.map(
        load: (_) async => await _load(emit),
      );
    });
  }
  _load(Emitter<AllPastEventsState> emit) async {
    if (state.allPastEventsList.isEmpty) {
      try {
        emit(state.copyWith(status: AllPastEventsStatus.loading));
        final pastEvents = await databaseRepository.getAllPastEvents();
        emit(state.copyWith(
            allPastEventsList: pastEvents, status: AllPastEventsStatus.loaded));
      } catch (e) {
        emit(state.copyWith(status: AllPastEventsStatus.error));
      }
    }
  }
}
