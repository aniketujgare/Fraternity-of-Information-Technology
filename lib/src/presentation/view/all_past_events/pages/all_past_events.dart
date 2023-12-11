import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/event_model.dart';
import '../../../../utils/constants/constants.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';
import '../bloc/all_past_events_bloc.dart';
import '../widgets/past_event_card.dart';

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
              toolbarHeight: 70,
              leading: SizedBox(),
              centerTitle: true,
              floating: true,
              title: Text(
                'All Past Events',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: kHeading2FontSize,
                ),
              ),
            ),
          ],
          body: BlocConsumer<AllPastEventsBloc, AllPastEventsState>(
            listener: (context, state) {
              if (state.status == AllPastEventsStatus.error) {
                kShowSnackBar(context, SnackType.error, state.errorMessage);
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case AllPastEventsStatus.loading:
                  return const Center(child: FITCircularLoadingIndicator());
                case AllPastEventsStatus.loaded:
                  final List<EventModel> allEventsList =
                      state.allPastEventsList;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: allEventsList.length,
                    itemBuilder: (context, index) {
                      return PastEventCard(
                          eventType: allEventsList[index].eventType!,
                          eventModel: allEventsList[index]);
                    },
                  );
                default:
                  return const Center(child: Text('Something went wrong!'));
              }
            },
          ),
        ),
      ),
    );
  }
}
