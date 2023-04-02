import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fraternity_of_information_technology/screens/home/widgets/event_winners_card.dart';

import '../../widgets/fit_app_bar.dart';
import 'widgets/home_header.dart';
import 'widgets/student_achievement.dart';
import 'widgets/upcoming_events.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        // backgroundColor: Colors.red,
        bottomNavigationBar: FITAppBar1(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(
                  userName: 'Mihir',
                  userAvatar:
                      'https://w0.peakpx.com/wallpaper/13/561/HD-wallpaper-anime-anime-waifu.jpg',
                  onPressed: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
