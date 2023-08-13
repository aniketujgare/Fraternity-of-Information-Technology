import 'package:flutter/material.dart';
import 'package:fraternity_of_information_technology/src/config/router/app_router_constants.dart';
import 'package:go_router/go_router.dart';

import 'widgets/event_winners_card.dart';
import 'widgets/fit_committee_card.dart';
import 'widgets/home_header.dart';
import 'widgets/student_achievement.dart';
import 'widgets/upcoming_events_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
              UpcomingEventsView(),
              EventWinnersCard(headTitle: 'Winners', topMargin: 10),
              StudentAchievement(headTitle: 'Honours Board'),
              AllEvents(
                date: 'date',
                headTitle: 'FIT Committee',
                organizer: 'organizer',
                eventTitle: 'Contest\nWorkshop\nCeremonies',
              ),
              FITCommitteeCard(
                date: 'date',
                headTitle: 'FIT Committee',
                organizer: 'organizer',
                eventTitle: 'FIT\nCommittee\nDBATU',
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}

class AllEvents extends StatelessWidget {
  final String headTitle;
  final String eventTitle;
  final String date;
  final String organizer;
  final double topMargin;

  const AllEvents({
    super.key,
    required this.date,
    required this.eventTitle,
    required this.organizer,
    this.topMargin = 20,
    required this.headTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Title Of card
        Container(
          margin: EdgeInsets.only(top: topMargin),
          padding: const EdgeInsets.only(left: 28),
          width: double.infinity,
          height: 31,
          child: const Text(
            'All Past Events',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        //* Card
        GestureDetector(
          onTap: () =>
              context.pushNamed(AppRoutConstants.allPastEventsView.name),
          child: Container(
            margin: const EdgeInsets.all(15),
            width: 337,
            height: 234,
            decoration: BoxDecoration(
              color: const Color(0XFFBA68C8),
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  offset: Offset(0, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 30,
                  bottom: 30,
                  child: Text(
                    eventTitle,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: -65,
                  bottom: -50,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      'assets/images/FIT_logo.png',
                      color: Colors.white.withAlpha(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
