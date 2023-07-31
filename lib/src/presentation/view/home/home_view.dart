import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/app_router_constants.dart';
import '../../blocs/update_account_bloc/update_account_bloc.dart';
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
              BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                builder: (context, state) {
                  if (state is FetchUserState) {
                    return HomeHeader(
                      userName: '${state.userModel.name}',
                      userAvatar: '${state.userModel.profilePic}',
                      // 'https://w0.peakpx.com/wallpaper/13/561/HD-wallpaper-anime-anime-waifu.jpg',
                      onPressed: () async {
                        GoRouter.of(context)
                            .pushNamed(AppRoutConstants.notificationView.name);
                      },
                    );
                  }
                  return const SizedBox(height: 120);
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
