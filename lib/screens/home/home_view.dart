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
                Container(
                  padding: const EdgeInsets.only(left: 28),
                  width: double.infinity,
                  height: 31,
                  child: const Text(
                    'Upcoming events',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const UpcomingEventsCard(
                  title: 'DSA Coding Competition',
                  date: '22/10/2023',
                  organizer: 'Mihir Madarchod',
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 28),
                  width: double.infinity,
                  height: 31,
                  child: const Text(
                    'Winners',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1.26,
                    ),
                  ),
                ),
                const EventWinnersCard(),
                const StudentAchievement(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
