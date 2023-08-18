import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/event_model.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/all_past_events_bloc/all_past_events_bloc.dart';
import '../../widgets/fit_circular_loading_indicator.dart';
import 'widgets/past_event_card.dart';

class AllPastEventsView extends StatelessWidget {
  const AllPastEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              toolbarHeight: 100,
              leading: SizedBox(),
              centerTitle: true,
              floating: true,
              title: Text(
                'All Past Events',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
          ],
          body: BlocConsumer<AllPastEventsBloc, AllPastEventsState>(
            listener: (context, state) {
              if (state is AllPastErrorState) {
                kShowSnackBar(context, SnackType.error, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is AllPastEventsLoading) {
                return const Center(child: FITCircularLoadingIndicator());
              } else if (state is AllPastEventsLoadedState) {
                final List<EventModel> allEventsList = state.allPastEventsList;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: allEventsList.length,
                  itemBuilder: (context, index) {
                    return PastEventCard(
                        eventType: allEventsList[index].eventType!,
                        eventModel: allEventsList[index]);
                  },
                );
              }
              return const Text('Something went wrong!');
            },
          ),
        ),
      ),
    );
  }
}
