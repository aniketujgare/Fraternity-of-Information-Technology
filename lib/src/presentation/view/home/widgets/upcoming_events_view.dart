import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../domain/models/event_model.dart';
import '../../../../utils/constants/constants.dart';
import '../../../blocs/my_slider/my_slider_bloc.dart';
import '../../../blocs/upcoming_events/upcoming_events_bloc.dart';
import 'upcoming_events.dart';

class UpcomingEventsView extends StatelessWidget {
  const UpcomingEventsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.only(left: 28),
          width: double.infinity,
          height: 31,
          child: const Text(
            'Upcoming events',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        BlocBuilder<UpcomingEventsBloc, UpcomingEventsState>(
          builder: (context, state) {
            if (state is UpcomingEventsLoadedState) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 1,
                    child: BlocBuilder<MySliderBloc, MySliderState>(
                      builder: (context, pos) {
                        if (state.upcomingEvents.isEmpty) {
                          return UpcomingEventsCard(
                              event: EventModel(
                                  eventTitle: 'Stay Tuned!!',
                                  eventOrganizers: ['FIT']));
                        }
                        if (pos is MySliderOnChanged ||
                            pos is MySliderInitial) {
                          return DotsIndicator(
                            dotsCount: state.upcomingEvents.length,
                            position: pos.value,
                            decorator: const DotsDecorator(
                                color: Colors.grey, // Inactive color
                                activeColor: kredDarkColor),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  // if (state.upcomingEvents.length <= 0)
                  CarouselSlider(
                    items: state.upcomingEvents
                        .map(
                          (event) => UpcomingEventsCard(
                            event: event,
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        height: 280.0,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          BlocProvider.of<MySliderBloc>(context).add(
                            MySliderOnChangedEvent(
                              value: index,
                            ),
                          );
                        },
                        viewportFraction: 0.85),
                  ),
                ],
              );
            } else {
              return SizedBox(
                height: 290,
                width: double.infinity,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(30),
                    height: 290,
                    width: double.infinity,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
