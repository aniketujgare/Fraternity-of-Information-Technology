import 'package:flutter/material.dart';
import '../../../utils/constants/constants.dart';

import 'widgets/event_winners_card.dart';
import 'widgets/fit_committee_card.dart';
import 'widgets/home_header.dart';
import 'widgets/student_achievement.dart';
import 'widgets/upcoming_events.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(
                userName: 'Mihir',
                userAvatar:
                    'https://w0.peakpx.com/wallpaper/13/561/HD-wallpaper-anime-anime-waifu.jpg',
                onPressed: () {
                  Navigator.pushNamed(context, ScreenName.notificationView);
                },
              ),
              const UpcomingEventsCard(
                headTitle: 'Upcoming events',
                eventTitle: 'DSA Coding Competition',
                date: '22/10/2023',
                organizer: 'Mihir Madarchod',
                topMargin: 0,
              ),
              const EventWinnersCard(headTitle: 'Winners'),
              const StudentAchievement(headTitle: 'Honours Board'),
              const FITCommitteeCard(
                date: 'date',
                headTitle: 'FIT Committee',
                organizer: 'organizer',
                eventTitle: 'FIT\nCommittee\nDBATU',
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}
