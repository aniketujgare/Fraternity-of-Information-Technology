import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/domain/models/event_model.dart';

import '../../../data/repositories/database_repository.dart';

part 'upcoming_events_event.dart';
part 'upcoming_events_state.dart';

class UpcomingEventsBloc
    extends Bloc<UpcomingEventsEvent, UpcomingEventsState> {
  final DatabaseRepository databaseRepository;
  UpcomingEventsBloc({required this.databaseRepository})
      : super(UpcomingEventsLoadingState()) {
    on<FetchUpcomingEventsEvent>((event, emit) async {
      try {
        final List<EventModel>? upcomingEventsList =
            await databaseRepository.getUpcomingEvents();
        if (upcomingEventsList != null) {
          emit(UpcomingEventsLoadedState(upcomingEvents: upcomingEventsList));
        }
      } catch (e) {
        emit(const UpcomingEventsErrorState(
            errorMessage: 'Failed to fetch upcoming events'));
      }
    });
  }
}
