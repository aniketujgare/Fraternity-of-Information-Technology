import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/domain/models/all_event_model.dart';

import '../../../data/repositories/database_repository.dart';

part 'all_past_events_event.dart';
part 'all_past_events_state.dart';

class AllPastEventsBloc extends Bloc<AllPastEventsEvent, AllPastEventsState> {
  final DatabaseRepository databaseRepository;

  AllPastEventsBloc({required this.databaseRepository})
      : super(AllPastEventsLoading()) {
    on<AllPastEventsEvent>((event, emit) async {
      try {
        final List<AllEventModel> pastEventsList =
            await databaseRepository.getAllPastEvents();
        emit(AllPastEventsLoadedState(allPastEventsList: pastEventsList));
      } catch (e) {
        emit(const AllPastErrorState(errorMessage: 'Failed to load Events!'));
      }
    });
  }
}
