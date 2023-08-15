// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/all_past_events_bloc/all_past_events_bloc.dart';

import '../../../domain/models/event_model.dart';
import '../../../utils/constants/constants.dart';
import '../../widgets/fit_circular_loading_indicator.dart';
import 'widgets/past_event_card.dart';

class AllPastEventsView extends StatelessWidget {
  const AllPastEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Text(
                  'All Past Events',
                  style: TextStyle(
                      fontSize: kHeadingFontSize,
                      color: kTextColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<AllPastEventsBloc, AllPastEventsState>(
                listener: (context, state) {
                  if (state is AllPastErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is AllPastEventsLoading) {
                    return const Center(child: FITCircularLoadingIndicator());
                  } else if (state is AllPastEventsLoadedState) {
                    final List<EventModel> allEventsList =
                        state.allPastEventsList;
                    return ListView.builder(
                      itemCount: allEventsList.length,
                      itemBuilder: (context, index) {
                        final event = allEventsList[index];

                        // final eventType = ;
                        return PastEventCard(
                            eventType: allEventsList[index].eventType!,
                            eventModel: event);
                      },
                    );
                  }
                  return const Text('Something went wrong!');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
