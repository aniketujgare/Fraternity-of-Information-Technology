import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/event_model.dart';

part 'all_past_events_event.dart';
part 'all_past_events_state.dart';

class AllPastEventsBloc extends Bloc<AllPastEventsEvent, AllPastEventsState> {
  final DatabaseRepository databaseRepository;

  AllPastEventsBloc({required this.databaseRepository})
      : super(AllPastEventsLoading()) {
    on<AllPastEventsEvent>((event, emit) async {
      try {
        final List<EventModel> pastEventsList =
            await databaseRepository.getAllPastEvents();
        emit(AllPastEventsLoadedState(allPastEventsList: pastEventsList));
      } catch (e) {
        emit(const AllPastErrorState(errorMessage: 'Failed to load Events!'));
      }
    });
  }
}
